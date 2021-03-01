
import RealmSwift
import Foundation
struct Datas :   Codable {
    var offset : Int?
     var limit : Int?
     var total : Int?
     var count : Int?
    var results : [Results]?
    
    init(offset : Int,limit : Int , total : Int, count : Int, results : [Results]) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
    

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
