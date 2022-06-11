//
//  ForgotPasswordViewController.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 07/06/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    //MARK: - IBoutlet
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.cornerRadius = 40
            backgroundView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    //MARK: - Variable
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        initializeView()
    }
    //MARK: - initialize View
    private func initializeView() {
        setImageInTextFeild()
        setUpButton()
        initializeTextFeild()
    }
    //MARK: - set up button
    private func setUpButton() {
        sendButton.set(cornerRadius: 4)
        sendButton.titleLabel?.font = .rubikMedium(size: 19)
    }
    //MARK: - initialize text field
    private func initializeTextFeild() {
        emailTextField.set(cornerRadius: 4)
        emailTextField.set(borderColor: .lightGray, borderWidth: 0.9)
        emailTextField.keyboardType = .emailAddress
        emailTextField.tintColor = #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1)
        emailTextField.text?.trimmed
    }
    //MARK: - set image in txet field
    private func setImageInTextFeild() {
        if let emailImage = UIImage(systemName: ImageNames.kEmail) { emailTextField.withImage(direction: .Left, image: emailImage) }
    }
    //MARK: - navigate
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
