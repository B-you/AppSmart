
import RealmSwift
import Foundation
class Json4Swift_Base : Object,  Codable {
    @objc dynamic var id : String = NSUUID().uuidString
    @objc dynamic var code : Int = 0
    @objc dynamic var status : String?
    @objc dynamic var copyright : String?
    @objc dynamic var attributionText : String?
    @objc dynamic var attributionHTML : String?
    @objc dynamic var data : Datas? 
    @objc dynamic var etag : String?
    
//    init(code : Int, status: String,copyright : String,attributionText : String,attributionHTML : String,data : Datas, etag : String) {
//        self.code = code
//        self.status = status
//        self.copyright = copyright
//        self.attributionText = attributionText
//        self.attributionHTML = attributionHTML
//        self.data = data
//        self.etag = etag
//    }

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case status = "status"
		case copyright = "copyright"
		case attributionText = "attributionText"
		case attributionHTML = "attributionHTML"
		case data = "data"
		case etag = "etag"
	}
    override static func primaryKey() -> String? {
        return "id"
    }

//    required init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//        code = try values.decodeIfPresent(Int.self, forKey: .code)!
//		status = try values.decodeIfPresent(String.self, forKey: .status)
//		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
//		attributionText = try values.decodeIfPresent(String.self, forKey: .attributionText)
//		attributionHTML = try values.decodeIfPresent(String.self, forKey: .attributionHTML)
//		data = try values.decodeIfPresent(Datas.self, forKey: .data)
//		etag = try values.decodeIfPresent(String.self, forKey: .etag)
//	}

}
