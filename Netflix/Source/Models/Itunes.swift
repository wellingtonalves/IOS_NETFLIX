//
// Created by Wellington Alves on 14/08/21.
//


struct Itunes: Decodable {
    var trailer: String
    var title: String
    var image: String

    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case trailer = "previewUrl"
        case image = "artworkUrl100"
    }
}
