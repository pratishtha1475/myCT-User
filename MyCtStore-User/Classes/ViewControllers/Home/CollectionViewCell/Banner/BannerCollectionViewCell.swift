//
//  BannerCollectionViewCell.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 14/06/22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(banner: Banner) {
        bannerImageView.image = UIImage(named: banner.fileName ?? "")
    }

}
