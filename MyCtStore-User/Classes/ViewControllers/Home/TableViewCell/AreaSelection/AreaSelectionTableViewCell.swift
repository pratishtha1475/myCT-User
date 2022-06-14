//
//  AreaSelectionTableViewCell.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import UIKit

class AreaSelectionTableViewCell: UITableViewCell, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var citySelctionButton: UIButton!
    @IBOutlet weak var areaSelectionButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        citySelctionButton.set(borderColor: .white, borderWidth: 1.4)
        areaSelectionButton.set(borderColor: .white, borderWidth: 1.4)
        citySelctionButton.set(cornerRadius: 6)
        areaSelectionButton.set(cornerRadius: 6)
        searchBar.delegate = self
//        searchBar.barTintColor = #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1)
        searchBar.tintColor = .white
    }
}
