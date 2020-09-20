import Foundation

#if DEBUG

import Foundation

class MOCKED_APIRequests_Success: APIRequest {

    fileprivate let topWeeklyURLMock = ImgurAPI.resourceURL.gallery(section: .top,
                                                                    sort: .top,
                                                                    window: .week,
                                                                    showViral: false,
                                                                    mature: false,
                                                                    albumPreviews: false)

    func get(url: URL, onSuccess: @escaping APIResponseSuccess, onError: @escaping ErrorClosure) {

        if url == topWeeklyURLMock.URLValue {
            onSuccess(MOCKED_APIResponses.MOCKED_TopWeeklyResponse.data(using: .utf8)!)
            return
        }
        onError(CustomError.error(message: "No MOCKED response found for URL \(url)"))
    }
}

#endif
