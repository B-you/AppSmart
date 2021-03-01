//
//  AvengerAPI.swift
//  AppSmartAudit
//
//  Created by 100 on 01.03.2021.
//

import Foundation
import Alamofire
import CryptoKit
import CommonCrypto
import RealmSwift


protocol CalendarServiceInterface{
  
}
class AvengerService{
    
    static let shared = AvengerService()
    required init() {}
    let publicapi = "79a9b5e483206b5b463e42017cc4ad48"
    let privateapi = "cec32fc4e5d5a44937699e8190fe3b635c37a6c8"
    let ts = "1"
    func getAvengers(closure: @escaping ((Json4Swift_Base) -> Void)){
        
        let hash = MD5(string: ts+privateapi+publicapi)
//        let Hash = ts+privateapi+publicapi.md5Value
        let urlstring = "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=\(publicapi)&hash=\(hash)"
        
        AF.request(urlstring, method:.get, encoding:URLEncoding.default).responseJSON { (response) in
                   guard let status = response.response?.statusCode else {return}
                   print("get avenger status is \(status)")
                   let decoder = JSONDecoder()
                   guard let data = response.data else {return}
                   switch status {
                   case 200:
                       guard let result = response.value else { return }
                       print(result)
                       print("success")
                       do {
//                        let gitData = try decoder.decode([Welcome].self, from: data)
                      
                           let parseddata = try decoder.decode(Json4Swift_Base.self, from: data)
                           DispatchQueue.main.async {
                               closure(parseddata)
//                            DispatchQueue.global(qos: .userInteractive).async {
//                                do{
//                                    let db = try Realm()
//                                    try! db.write{
//                                        db.add(parseddata, update: .all)
//                                    }
//                                }catch{
//                                    
//                                }
//                            }
                           }
                       } catch let error{
                           print("avenger getting error is \(error.localizedDescription)")
                       }
             
                   case 409:
                       print("error")
                  
                   
                   default:
                       print("ok")
                       
                   }
               }
        
    }
    func getAvengerWithID(id : Int, closure: @escaping ((Json4Swift_Base) -> Void)){
        
        let hash = MD5(string: ts+privateapi+publicapi)
        let urlstring = "https://gateway.marvel.com:443/v1/public/characters/\(id)?ts=1&apikey=\(publicapi)&hash=\(hash)"
        
        AF.request(urlstring, method:.get, encoding:URLEncoding.default).responseJSON { (response) in
                   guard let status = response.response?.statusCode else {return}
                   print("get avenger status is \(status)")
                   let decoder = JSONDecoder()
                   guard let data = response.data else {return}
                   switch status {
                   case 200:
                       guard let result = response.value else { return }
                       print(result)
                       print("success")
                       do {
                           let parseddata = try decoder.decode(Json4Swift_Base.self, from: data)
                           DispatchQueue.main.async {
                               closure(parseddata)
//                            DispatchQueue.global(qos: .userInteractive).async {
//                                do{
//                                    let db = try Realm()
//                                    try! db.write{
//                                        db.add(parseddata, update: .all)
//                                    }
//                                }catch{
//
//                                }
//                            }
                           }
                       } catch let error{
                           print("event getting error is \(error.localizedDescription)")
                       }
             
                   case 409:
                       print("error")
                  
                   
                   default:
                       print("ok")
                       
                   }
               }
        
    }
    func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8)!)

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    

}
