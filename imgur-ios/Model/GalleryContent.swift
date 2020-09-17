import Foundation

struct GalleryContent: Codable {
    let id, title: String
    let ups, downs, commentCount, views: Int
    let link: String
    let images: [Image]

    enum CodingKeys: String, CodingKey {
        case id, title, ups, downs
        case commentCount = "comment_count"
        case views, link, images
    }
}
