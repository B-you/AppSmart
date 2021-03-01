//
//  DetailsViewController.swift
//  AppSmartAudit
//
//  Created by 100 on 01.03.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    var id : Int?
    var detailresult = [Json4Swift_Base]()
    var itemresult = [Items]()
  
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        if let identity = id {
            AvengerService.shared.getAvengerWithID(id: identity) { (result) in
//                self.detailresult.append(result)
                self.itemresult.append(contentsOf: (result.data?.results?[0].comics?.items)!)
                self.imageView.sd_setImage(with: URL(string: (result.data?.results?[0].thumbnail?.path)!+".jpg"), placeholderImage: UIImage(named: "ic_launcher.png"))
                self.topLabel.text = result.data?.results![0].name
                self.collectionView.reloadData()
          
            }
        }
    }
    

}

extension DetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemresult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCell", for: indexPath) as! DetailsCollectionViewCell
        cell.topLabel.text = itemresult[indexPath.row].name
        cell.bottomLabel.text = itemresult[indexPath.row].resourceURI
        return cell
    }
    
    
}
