
import Foundation

struct API: Decodable {
    let data: [MovieData]
}

struct MovieData: Decodable {
    let id: Int
    let title: String
    let directed_by: String
}
