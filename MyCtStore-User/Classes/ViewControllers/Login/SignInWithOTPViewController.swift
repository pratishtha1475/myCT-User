//
//  SignInWithOTPViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 07/06/22.
//

import UIKit

class SignInWithOTPViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.cornerRadius = 40
            backgroundView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var signInUsingOTPLabel: UILabel!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var registrationWithUsButton: UIButton!
    //MARK: - life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        initializeView()
    }
    //MARK: - initialize View
    private func initializeView() {
        setUpTextField()
        setImageInTextField()
    }
    //MARK: - set up textField
    private func setUpTextField() {
        phoneNumberTextField.set(borderColor: .darkGray, borderWidth: 0.9)
        phoneNumberTextField.set(cornerRadius: 4)
        phoneNumberTextField.text?.trimmed
    }
    //MARK: - set image in text field
    private func setImageInTextField() {
        if let phoneNoImage = UIImage(systemName: ImageNames.KPhoneNumber) { phoneNumberTextField.withImage(direction: .Left, image: phoneNoImage) }
    }
    //MARK: - navigate Push View Controller
    func navigateToPush(viewController: String) {
        let verifyOTPViewController = Config.storyBoard.instantiateViewController(withIdentifier: viewController)
        navigationController?.pushViewController(verifyOTPViewController, animated: true)
    }
    //MARK: - navigation
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func sendButtonTapped(_ sender: Any) {
        navigateToPush(viewController: NavigatePageTo.verifyOTPViewController)
    }
    
    @IBAction func registerWithUsButtonTapped(_ sender: Any) {
        navigateToPush(viewController: NavigatePageTo.registrationViewController)
    }
}
