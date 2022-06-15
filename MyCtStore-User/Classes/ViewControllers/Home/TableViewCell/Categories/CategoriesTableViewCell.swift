//
//  CategoriesTableViewCell.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoriesCollectionView: HomeCollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(categories: [Category]) {
        categoriesCollectionView.arrCategory = categories
        
        categoriesCollectionView.reloadData()
    }
}
