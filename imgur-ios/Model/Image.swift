import Foundation

struct Image: Codable {
    let id, imageDescription: String
    let datetime: Int
    let type: String
    let animated: Bool
    let width, height, size, views: Int
    let link: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageDescription = "description"
        case datetime, type, animated, width, height, size, views, link
    }
}
