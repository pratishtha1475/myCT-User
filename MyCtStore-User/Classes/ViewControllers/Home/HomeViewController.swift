//
//  HomeViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 09/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeTableView: UITableView!

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
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}
//MARK: - TableView Delegate & DataSource Method
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
