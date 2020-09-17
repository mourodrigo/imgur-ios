import Foundation
import RxSwift

enum GalleryRepositoryStatus {
    case success(content: [GalleryContent])
    case loading
    case error(error: Error)
}


protocol GalleryRepositoryProtocol {
    var state: Observable<GalleryRepositoryStatus> { get }
    func fetch()
}

class GalleryRepository: GalleryRepositoryProtocol {

    //*************************************************
    // MARK: - Properties
    //*************************************************
    private let _api: APIRequest
    private let _state = BehaviorSubject<GalleryRepositoryStatus>(value: .loading)
    var state: Observable<GalleryRepositoryStatus> { return _state.asObserver() }

    //*************************************************
    // MARK: - Life Cycle
    //*************************************************

    init(api: APIRequest = AFRequest()) {
        _api = api
        fetch()
    }

    func fetch() {
        _state.onNext(.loading)

        let resource = ImgurAPI.resourceURL.gallery(section: .top,
                                                sort: .top,
                                                window: .week,
                                                showViral: false,
                                                mature: false,
                                                albumPreviews: false)

        _api.get(url: resource.URLValue,
                onSuccess: { [weak self] (data) in
                    if let object = data.mapObject(GalleryResponse.self) {
                        self?._state.onNext(.success(content: object.data))
                        return
                    }
                    self?._state.onNext(.error(error: CustomError.mappingResponse))
        }) { [weak self] (error) in
            self?._state.onNext(.error(error:
                    CustomError.serverError(details: error.localizedDescription)))
        }
    }

}
