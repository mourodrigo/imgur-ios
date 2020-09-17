import Foundation
import RxSwift
import RxCocoa

enum MainGalleryStatus {
    case success(content: [GalleryContent])
    case loading
    case error(error: Error)
}

protocol MainGalleryViewModelProtocol {

}

class MainGalleryViewModel: MainGalleryViewModelProtocol {

    //************************************************
    // MARK: - Properties
    //************************************************

    private let _disposeBag = DisposeBag()
    private let _galleryRepository: GalleryRepositoryProtocol?
    private let _state = BehaviorSubject<MainGalleryStatus>(value: .loading)
    var state: Observable<MainGalleryStatus> { return _state.asObserver() }

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
                    self?._state.onNext(.success(content: content))
                case .loading:
                    self?._state.onNext(.loading)
                case .error(error: let error):
                    self?._state.onNext(.error(error: error))
                }
            })
            .disposed(by: _disposeBag)
    }

    //************************************************
    // MARK: - Handle Actions
    //************************************************

}
