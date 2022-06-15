//
//  HomeViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 09/06/22.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    //MARK: - varaible
    var viewModel: HomeViewModel = HomeViewModel()
    //MARK: - life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        getCategoryAPI()
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
        tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
    }
    //MARK: - get category API
    private func getCategoryAPI() {
        guard Singleton.sharedInstance.isNetworkAvailable() else {
            present(Utils.setALert(title: nil, message: Strings.kInternetNotAvailable), animated: true, completion: nil)
            return
        }
        viewModel.getResult { isAPISuccess, apiFailureMessage in
            if isAPISuccess {
                self.tableView.reloadData()
            } else {
                print(apiFailureMessage)
            }
        }
        
        viewModel.getBannerResult { isAPISuccess, apiFailureMessage in
            if isAPISuccess {
                self.tableView.reloadData()
            } else {
                print(apiFailureMessage)
            }
        }
    }
}
//MARK: - TableView Delegate & DataSource Method
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 3 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: AreaSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AreaSelectionTableViewCell", for: indexPath) as!AreaSelectionTableViewCell
            return cell
        case 1:
            let cell: CategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
            cell.set(categories: viewModel.categoryArray)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            cell.set(banner: viewModel.bannerArray)
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 100
        case 1: return 60
        case 2: return 300
        default: return 0
        }
    }
}
