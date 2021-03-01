
import RealmSwift
import Foundation
struct Items :  Codable {
    var resourceURI : String?
   var name : String?
    var type : String?

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
