//
//  HomeViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 09/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    //MARK: - varaible
    var viewModel: HomeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    //MARK: - initialize
    func initialize() {
        configureTableView()
    }
    //MARK: - configure tableView
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AreaSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "AreaSelectionTableViewCell")
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
    //MARK: - get category API
    private func getCategoryAPI() {
        guard Singleton.sharedInstance.isNetworkAvailable() else {
            present(Utils.setALert(title: nil, message: Strings.kInternetNotAvailable), animated: true, completion: nil)
            return
        }
        viewModel.request { result in
            switch result {
            case .success(let category): print(category)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
}
//MARK: - TableView Delegate & DataSource Method
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
//        case 1: return CategoryData
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: AreaSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AreaSelectionTableViewCell", for: indexPath) as!AreaSelectionTableViewCell
            return cell
        case 1:
            let cell: CategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as!CategoriesTableViewCell
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.item {
        case 0: return 100
        case 1: return 70
        default: return 0
        }
    }
}
