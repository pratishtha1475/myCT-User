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
    
    //MARK: - variables
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
    //MARK: - show Activity Indicator
    func showActivityIndicatory() {
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        container.backgroundColor = .clear
        
        let activityView = UIActivityIndicatorView(style: .gray)
        activityView.center = self.view.center
        container.addSubview(activityView)
        self.view.addSubview(container)
        activityView.startAnimating()
    }
    //MARK: - hide Activity Indicator
    func hideActivityIndicator() {
        let activityView = UIActivityIndicatorView()
        if (activityView != nil) {
            activityView.stopAnimating()
        }
    }
    //MARK: - navigate Push View Controller
    func navigateToPush(viewController: String) {
        let registarationViewController = Config.storyBoard.instantiateViewController(withIdentifier: viewController)
        navigationController?.pushViewController(registarationViewController, animated: true)
    }
    //MARK: - Button clicks
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
        let validateResult = loginViewModel.validate(email: emailTextField.text!, password: passwordTextField.text!)
        showActivityIndicatory()
        
        guard validateResult.isValid else {
            present(Utils.setALert(title: nil, message: validateResult.message), animated: true, completion: nil)
            return
        }
        guard Singleton.sharedInstance.isNetworkAvailable() else {
            present(Utils.setALert(title: nil, message: Strings.kInternetNotAvailable), animated: true, completion: nil)
            return
        }
        loginViewModel.login(email: emailTextField.text ?? "" , password: passwordTextField.text ?? "") { (result) in
            switch result {
            case .success(let loginDetails):
                print(loginDetails)
                DEFAULTS.setLoginDetails(loginData: loginDetails.toDictionary())
                DEFAULTS.setUserLoginId(loginId: String(loginDetails.id))
                print("Login is done hahahhahaha")
                self.hideActivityIndicator()
                //navigateToPush(viewController: NavigatePageTo.tabBarViewController)
            case.failure(let error):
                self.hideActivityIndicator()
                print(error)
            }
        }
    }
    
    @IBAction func signInWithOTPButtonTapped(_ sender: UIButton) {
        navigateToPush(viewController: NavigatePageTo.signInWithOTPViewController)
    }
}
//MARK: - Defaults class
class DEFAULTS: NSObject {
    class func isLogin() -> Bool {
        if (UserDefaults.standard.object(forKey: "loginId") as? String) != nil && (UserDefaults.standard.object(forKey: "loginId") as? String) != "" {
            return true
        }
        return false
    }
    
    class func setLoginDetails(loginData : [String:Any]) {
        UserDefaults.standard.set(loginData, forKey: "LoginDetailModel")
        UserDefaults.standard.synchronize()
    }
    
    class func getLoginDetails() -> LoginModel {
        let dic =  (UserDefaults.standard.value(forKey: "LoginDetailModel") != nil) ? UserDefaults.standard.value(forKey: "LoginDetailModel") as! NSDictionary : NSDictionary()
        return LoginModel(fromDictionary: dic as! [String : Any])
    }
    
    class func setUserLoginId(loginId : String) {
        UserDefaults.standard.set(loginId, forKey: "loginId")
        UserDefaults.standard.synchronize()
    }
    
    class func getUserLoginId() -> String {
        if let loginDetails = UserDefaults.standard.object(forKey: "loginId") as? String {
            return loginDetails
        }
        return ""
    }
}
