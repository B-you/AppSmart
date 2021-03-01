
import RealmSwift
import Foundation
class Results : Object, Codable {
    
    
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String?
    @objc dynamic var thedescription : String?
    @objc dynamic var modified : String?
    @objc dynamic var resourceURI : String?
    var urls : [Urls]?
    @objc dynamic var thumbnail : Thumbnail?
    @objc dynamic var comics : Comics?
    @objc dynamic var stories : Stories?
    @objc dynamic var events : Events?
    @objc dynamic var series : Series?
    
//    init(id : Int,name : String,description : String, modified : String, resourceURI : String, urls : [Urls], thumbnail : Thumbnail,comics : Comics, stories : Stories,events : Events,   series : Series  ) {
//        self.id = id
//        self.name = name
//        self.thedescription = description
//        self.modified = modified
//        self.resourceURI = resourceURI
//        self.urls = urls
//        self.thumbnail = thumbnail
//        self.comics = comics
//        self.stories = stories
//        self.events = events
//        self.series = series
//
//    }

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case thedescription = "description"
		case modified = "modified"
		case resourceURI = "resourceURI"
		case urls = "urls"
		case thumbnail = "thumbnail"
		case comics = "comics"
		case stories = "stories"
		case events = "events"
		case series = "series"
	}

//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		id = try values.decodeIfPresent(String.self, forKey: .id)
//		name = try values.decodeIfPresent(String.self, forKey: .name)
//		description = try values.decodeIfPresent(String.self, forKey: .description)
//		modified = try values.decodeIfPresent(String.self, forKey: .modified)
//		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
//		urls = try values.decodeIfPresent([Urls].self, forKey: .urls)
//		thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
//		comics = try values.decodeIfPresent(Comics.self, forKey: .comics)
//		stories = try values.decodeIfPresent(Stories.self, forKey: .stories)
//		events = try values.decodeIfPresent(Events.self, forKey: .events)
//		series = try values.decodeIfPresent(Series.self, forKey: .series)
//	}

}
