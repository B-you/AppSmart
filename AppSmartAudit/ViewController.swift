//
//  ViewController.swift
//  AppSmartAudit
//
//  Created by 100 on 01.03.2021.
//

import UIKit
import SDWebImage
import RealmSwift
class ViewController: UIViewController, UITextFieldDelegate {
    var result = [Json4Swift_Base]()
    var myresult = [Results]()
    var mysearchresult = [Results]()
    var identity : Int?

    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let realm = try! Realm()
////        let matched = realm.object(ofType: mysearchresult.self, forPrimaryKey: <#_#>)
//        let info = realm.objects(Json4Swift_Base.self)
//        print("info is \(info)")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        AvengerService.shared.getAvengers { (result) in
            self.result.append(result)
            self.mysearchresult.append(contentsOf: (result.data?.results)!)
            self.myresult.append(contentsOf: (result.data?.results)!)
//            self.myresult.append(result.data?.results)
            print("the count is \(self.result[0].data?.results!.count)")
            
           
           
            self.collectionView.reloadData()
        }
        self.searchTF.delegate = self
        searchTF.addTarget(nil, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let vc = segue.destination as? DetailsViewController  {
                vc.id =  identity
//                vc.modalPresentationStyle = .fullScreen
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTF.resignFirstResponder()
        return true
    }
    @objc func textFieldDidChange(_ textField : UITextField) {

        guard let searchText = textField.text else {
            mysearchresult = myresult
            return }
        mysearchresult = myresult.filter{
            res in
            if searchText == ""{
                return true
            }
            if res.name == "" {
                return false
            }
            return (res.name!.lowercased().contains((searchText.lowercased())))
        }
       self.collectionView.reloadData()
    }
 
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.identity =   mysearchresult[indexPath.row].id
        self.performSegue(withIdentifier: "toDetails", sender: self)
       
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return  mysearchresult.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AvengerCollectionViewCell
        guard mysearchresult.count > indexPath.row else { return UICollectionViewCell()}
        cell.avatarImageView.sd_setImage(with: URL(string: ( mysearchresult[indexPath.row].thumbnail?.path)!+".jpg"), placeholderImage: UIImage(named: "ic_launcher.png"))

        cell.nameLabel.text =  mysearchresult[indexPath.row].name
        cell.descriptionLabel.text =  mysearchresult[indexPath.row].thedescription
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = collectionView.bounds.width/2.0 - 10
        var height = width
        if width < 150 {
            width = 250
            height = 185
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
}
