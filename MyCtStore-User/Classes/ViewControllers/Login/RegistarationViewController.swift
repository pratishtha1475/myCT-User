//
//  RegistarationViewController.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 07/06/22.
//

import UIKit

class RegistarationViewController: UIViewController {
    //MARK: - IBoutlets
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.cornerRadius = 40
            backgroundView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ckeckBoxButton: UIButton! {
        didSet {
            ckeckBoxButton.setImage(UIImage(systemName: ImageNames.kCheckBoxUnChecked), for: .normal)
            ckeckBoxButton.setImage(UIImage(systemName: ImageNames.kCkeckBoxChecked), for: .selected)
        }
    }
    @IBOutlet weak var sendOTPButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var privacyPolicy: UILabel!
    @IBOutlet weak var termsAndCondition: UILabel!
    //MARK: - view life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        initializeView()
    }
    //MARK: - initialize View
    private func initializeView() {
        initializeTextField()
        setButton()
        setImageInTextField()
    }
    //MARK: - initialize text field
    private func initializeTextField() {
        set(textField: firstNameTextField)
        set(textField: emailIdTextField)
        set(textField: phoneNumberTextField)
        set(textField: passwordTextField)
        firstNameTextField.keyboardType = .alphabet
        emailIdTextField.keyboardType = .emailAddress
        phoneNumberTextField.keyboardType = .numberPad
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
    }
    //MARK: - set textFeild
    private func set(textField: UITextField) {
        textField.set(cornerRadius: 4)
        textField.set(borderColor: .lightGray, borderWidth: 0.9)
        textField.tintColor = #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1)
        textField.text?.trimmed
    }
    //MARK: - set button
    private func setButton() {
        sendOTPButton.set(cornerRadius: 4)
        sendOTPButton.titleLabel?.font = .rubikSemiBold(size: 19)
        loginButton.titleLabel?.font = .rubikMedium(size: 17)
    }
    //MARK: - set image in text field
    private func setImageInTextField() {
        if let userImage = UIImage(systemName: ImageNames.kUser) { firstNameTextField.withImage(direction: .Left, image: userImage) }
        if let emailImage = UIImage(systemName: ImageNames.kEmail) { emailIdTextField.withImage(direction: .Left, image: emailImage) }
        if let phoneNoImage = UIImage(systemName: ImageNames.KPhoneNumber) { phoneNumberTextField.withImage(direction: .Left, image: phoneNoImage) }
        if let passwordImage = UIImage(systemName: ImageNames.kPassword) { passwordTextField.withImage(direction: .Left, image: passwordImage) }
    }
    //MARK: - password button tapped
    @IBAction func showPasswordButtonTapped(_ sender: UIButton) {
        self.passwordTextField.togglePasswordImage(button: sender )
    }
    //MARK: - check box button tapped
    @IBAction func checkBoxButtonTapped(_ sender: UIButton) {
        ckeckBoxButton.checkBoxAnimation {
            print(sender.isSelected)
        }
    }
    //MARK: - navigate Push View Controller
    func navigateToPush(viewController: String) {
        let verifyOTPViewController = Config.storyBoard.instantiateViewController(withIdentifier: viewController)
        navigationController?.pushViewController(verifyOTPViewController, animated: true)
    }
    //MARK: - navigate
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendOTPButtonTapped(_ sender: Any) {
        navigateToPush(viewController: NavigatePageTo.verifyOTPViewController)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
