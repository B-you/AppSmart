
import RealmSwift
import Foundation
class Urls : Object,  Codable {
    @objc dynamic var type : String?
    @objc dynamic var url : String?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case url = "url"
	}

//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//        url = try values.decodeIfPresent(String.self, forKey: .url)
//    }

}
