
import RealmSwift
import Foundation
class Datas : Object,  Codable {
    @objc dynamic var offset : Int = 0
    @objc dynamic var limit : Int = 0
    @objc dynamic var total : Int = 0
    @objc dynamic var count : Int = 0
    var results : [Results]?
    
//    init(offset : Int,limit : Int , total : Int, count : Int, results : [Results]) {
//        self.offset = offset
//        self.limit = limit
//        self.total = total
//        self.count = count
//        self.results = results
//    }
    

	enum CodingKeys: String, CodingKey {

		case offset = "offset"
		case limit = "limit"
		case total = "total"
		case count = "count"
		case results = "results"
	}

//    required init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//        offset = try values.decodeIfPresent(Int.self, forKey: .offset)!
//        limit = try values.decodeIfPresent(Int.self, forKey: .limit)!
//        total = try values.decodeIfPresent(Int.self, forKey: .total)!
//        count = try values.decodeIfPresent(Int.self, forKey: .count)!
//		results = try values.decodeIfPresent([Results].self, forKey: .results)
//	}

}
