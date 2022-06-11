//
//  LoginViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 06/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.cornerRadius = 40
            backgroundView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var privacyPolicyLabel: UILabel!
    @IBOutlet weak var termsAndConditionsLabel: UILabel!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerWithUsButton: UIButton!
    @IBOutlet weak var signInWithOTPButton: UIButton!
    //MARK: - varaible
    var isTapped = true
    var loginViewModel: LoginViewModel = LoginViewModel()
    //MARK: - life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    //MARK: - initialze view
    private func initializeView() {
        set(textField: emailTextField)
        set(textField: passwordTextField)
        setUpButton()
        setImageInTextFeild()
    }
    //MARK: - set text Field
    private func set(textField: UITextField) {
        textField.set(cornerRadius: 4)
        textField.set(borderColor: .lightGray, borderWidth: 0.9)
        textField.tintColor = #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1)
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        textField.text?.trimmed
    }
    //MARK: - set up button (using OTP)
    private func setUpButton() {
        signInButton.set(cornerRadius: 4)
        signInWithOTPButton.set(cornerRadius: 4)
        registerWithUsButton.titleLabel?.font = .rubikMedium(size: 17)
        forgotPasswordButton.titleLabel?.font = .rubikMedium(size: 16)
        signInWithOTPButton.set(borderColor: #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1), borderWidth: 1.4)
    }
    //MARK: - set image in text field
    private func setImageInTextFeild() {
        if let emailImage = UIImage(systemName: ImageNames.kEmail) { emailTextField.withImage(direction: .Left, image: emailImage) }
        if let passwordImage = UIImage(systemName: ImageNames.kPassword) { passwordTextField.withImage(direction: .Left, image: passwordImage) }
    }
    //MARK: - navigate Push View Controller
    func navigateToPush(viewController: String) {
        let registarationViewController = Config.storyBoard.instantiateViewController(withIdentifier: viewController)
        navigationController?.pushViewController(registarationViewController, animated: true)
    }
    //MARK: - navigation
    @IBAction func showPasswordButtonTapped(_ sender: UIButton) {
        self.passwordTextField.togglePasswordImage(button: sender )
    }

    @IBAction func registerWithUsButtontapped(_ sender: Any) {
        navigateToPush(viewController: NavigatePageTo.registrationViewController)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        navigateToPush(viewController: NavigatePageTo.forgotPasswordViewController)
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signInWithOTPButtonTapped(_ sender: UIButton) {
        navigateToPush(viewController: NavigatePageTo.signInWithOTPViewController)
    }
    
}
