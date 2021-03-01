
import RealmSwift
import Foundation
class Items : Object, Codable {
    @objc dynamic var resourceURI : String?
    @objc dynamic var name : String?
    @objc dynamic var type : String?

	enum CodingKeys: String, CodingKey {

		case resourceURI = "resourceURI"
		case name = "name"
        case type = "type"
	}

//    required init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
//		name = try values.decodeIfPresent(String.self, forKey: .name)
//	}

}
