//
//  HomeCollectionView.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import Foundation
import UIKit

enum ActionFor {
    case category
    case banner
}
class HomeCollectionView: UICollectionView {
    
    var edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    var arrCategory: [Category] = []
    var bannerArray: [Banner] = []
    var itemArray: [ItemData] = []
    var action: ActionFor = .category
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        self.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
    }
}
extension HomeCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch action {
        case .category: return arrCategory.count
        case .banner: return bannerArray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch action {
        case .category:
            let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.categoryLabel.text = arrCategory[indexPath.row].type
            return cell
        case .banner:
            let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
            cell.bannerImageView.image = UIImage(named: bannerArray[indexPath.row].fileName!)
            return cell
        }
    }
}
extension HomeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch action {
        case .category: return CGSize(width: 100, height: 50)
        case .banner: return CGSize(width: frame.width, height: 300)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return edgeInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return edgeInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return edgeInsets
    }
}
