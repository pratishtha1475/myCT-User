//
//  VerifyOTPViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 08/06/22.
//

import UIKit

class VerifyOTPViewController: UIViewController {
    
    //MARK: - IBoutlets
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.cornerRadius = 40
            backgroundView.layer.masksToBounds = true
        }
    }
    //MARK: - life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }
    //MARK: - initialize view
    private func initializeView() {
//        setImageInTextField()
    }
    //MARK: - navigate Push View Controller
    func navigateToPush(viewController: String) {
        let registarationViewController = Config.storyBoard.instantiateViewController(withIdentifier: viewController)
        navigationController?.pushViewController(registarationViewController, animated: true)
    }
    //MARK: - navigate
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
    }
    
    @IBAction func resendOTPButtonTapped(_ sender: Any) {
    }
}
