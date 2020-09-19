import Foundation

struct GalleryContent: Codable {
    let id, title: String
    let ups, downs, commentCount, views: Int
    let link: String
    let type: String?
    let images: [Image]?

    enum CodingKeys: String, CodingKey {
        case id, title, ups, downs, type
        case commentCount = "comment_count"
        case views, link, images
    }

    var availableMediaLink: String {
        return images?.first?.link ?? link
    }

    var mediaType: MediaType? {
        return MediaType(value: images?.first?.type ?? type)
    }

    var availableMediaIsImage: Bool {
        let mediaType = (images?.first?.type ?? type) ?? ""
        return mediaType.contains("image/jpeg") || mediaType.contains("image/png")
    }

}
