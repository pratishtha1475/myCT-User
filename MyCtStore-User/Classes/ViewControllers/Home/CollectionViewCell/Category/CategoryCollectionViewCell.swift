//
//  CategoryCollectionViewCell.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryLabel.set(borderColor: #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1), borderWidth: 1.2)
        categoryLabel.set(cornerRadius: 4)
    }
    
    func set(category: Category) {
        categoryLabel.text = category.type
    }

}
