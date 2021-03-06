import Foundation
import RxSwift
import RxCocoa

enum MainGalleryStatus {
    case success
    case loading
    case error(error: Error)

    static func == (lhs: MainGalleryStatus, rhs: MainGalleryStatus) -> Bool {
        switch (lhs, rhs) {
        case  (.success,.success):
            return true
        case (.loading, .loading):
            return true
        case let (.error(error: errorA), .error(error: errorB)):
            return errorA.localizedDescription == errorB.localizedDescription
        default:
            return false
        }
    }

}

protocol MainGalleryViewModelProtocol {
    func item(for row: Int) -> GalleryContent
    func didSelectItem(at index: Int)
    var numberOfItems: Int { get }
    var state: Observable<MainGalleryStatus> { get }
    func fetch()
    var moduleTitle: String { get }
}

class MainGalleryViewModel: MainGalleryViewModelProtocol {

    //************************************************
    // MARK: - Properties
    //************************************************

    private let _disposeBag = DisposeBag()
    private let _galleryRepository: GalleryRepositoryProtocol?
    private let _state = BehaviorSubject<MainGalleryStatus>(value: .loading)
    private var _content = [GalleryContent]()
    var state: Observable<MainGalleryStatus> { return _state.asObserver() }

    var moduleTitle: String {
        return "Top Weekly"
    }

    //************************************************
    // MARK: - Lifecycle
    //************************************************

    init(repository: GalleryRepositoryProtocol = GalleryRepository()) {
        _galleryRepository = repository
        setup()
    }

    private func setup() {
        _galleryRepository?.state
            .bind(onNext: { [weak self] (value) in
                switch value {
                case .success(content: let content):
                    self?._content.removeAll()
                    self?._content.append(contentsOf: content)
                    self?._state.onNext(.success)
                case .loading:
                    self?._state.onNext(.loading)
                case .error(error: let error):
                    self?._state.onNext(.error(error: error))
                    self?.retryFetch()
                }
            })
            .disposed(by: _disposeBag)
    }

    private func retryFetch() {
        DispatchQueue.global().asyncAfter(deadline: .now()+1) {
            self.fetch()
        }
    }

    //************************************************
    // MARK: - Content & Actions
    //************************************************

    func item(for row: Int) -> GalleryContent {
        return _content[row]
    }

    func didSelectItem(at index: Int) {
        let item = _content[index]
        print(item)
   }

    var numberOfItems: Int {
        return _content.count
    }

    func fetch() {
        _galleryRepository?.fetch()
    }

}
