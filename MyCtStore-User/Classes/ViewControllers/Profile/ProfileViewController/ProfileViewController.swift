//
//  ProfileViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 09/06/22.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileLetterView: UIView!
    @IBOutlet weak var profileLetterLabel: UILabel!
    @IBOutlet weak var profilePersonNameLabel: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    //MARK: - Variables
    var arrOptionForLoginUser = ["Edit Profile", "Change Password", "My Ratings", "My Addresses", "My Favourites", "Support", "Share MyCt Store App", "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    //MARK: - initialize
    private func initialize() {
        setUpView()
        configTableView()
    }
    //MARK: - set view
    private func setUpView() {
        profileView.set(cornerRadius: 10)
        profileLetterView.set(cornerRadius: 36)
    }
    //MARK: - configure table view
    private func configTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    }
    //MARK: - navigate Push View Controller
    func navigateToPush(viewController: String) {
        let verifyOTPViewController = Config.storyBoard.instantiateViewController(withIdentifier: viewController)
        navigationController?.pushViewController(verifyOTPViewController, animated: true)
    }
}
//MARK: - tableView Delegate & data source methods
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOptionForLoginUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.optionLabel?.text = arrOptionForLoginUser[indexPath.row]
        tableView.separatorStyle = .singleLine
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch arrOptionForLoginUser[indexPath.row] {
        case "Edit Profile" :
            navigateToPush(viewController: NavigatePageTo.editProfileViewController)
        case "Change Password" :
            navigateToPush(viewController: NavigatePageTo.changePasswordViewController)
        default:
            print(arrOptionForLoginUser[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
