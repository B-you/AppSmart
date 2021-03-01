import RealmSwift

import Foundation
struct Thumbnail :  Codable {
    var path : String?
    var theextension : String?

	enum CodingKeys: String, CodingKey {

		case path = "path"
		case theextension = "extension"
	}

//    required init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		path = try values.decodeIfPresent(String.self, forKey: .path)
//		theextension = try values.decodeIfPresent(String.self, forKey: .theextension)
//	}

}
