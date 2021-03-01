
import RealmSwift
import Foundation
class Stories : Object,  Codable {
    @objc dynamic var available : Int = 0
    @objc dynamic var returned : Int = 0
    @objc dynamic var collectionURI : String?
     var items : [Items]?

	enum CodingKeys: String, CodingKey {

		case available = "available"
		case returned = "returned"
		case collectionURI = "collectionURI"
		case items = "items"
	}

//    required init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//        available = try values.decodeIfPresent(Int.self, forKey: .available)!
//        returned = try values.decodeIfPresent(Int.self, forKey: .returned)!
//		collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
//		items = try values.decodeIfPresent([Items].self, forKey: .items)
//	}

}
