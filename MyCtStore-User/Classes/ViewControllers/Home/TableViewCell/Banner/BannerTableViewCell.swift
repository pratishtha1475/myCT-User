//
//  BannerTableViewCell.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 14/06/22.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: HomeCollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(banner: [Banner]) {
        collectionView.bannerArray = banner
        collectionView.reloadData()
    }

}
