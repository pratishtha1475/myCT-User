//
//  ChangePasswordViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 13/06/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    //MARK: - initialize
    private func initialize() {
        initializeView()
    }
    
    //MARK: - initializeView
    private func initializeView() {
        navigationController?.isNavigationBarHidden = true
        set(textField: oldPasswordTextField)
        set(textField: newPasswordTextField)
        set(textField: confirmPasswordTextField)
        setUpButton()
    }
    //MARK: - setUp text Field
    private func set(textField: UITextField) {
        textField.set(cornerRadius: 4)
        textField.set(borderColor: .lightGray, borderWidth: 0.9)
        textField.tintColor = #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1)
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.text?.trimmed
    }
    //MARK: - setUp Button
    private func setUpButton() {
        updateButton.set(cornerRadius: 8)
        updateButton.titleLabel?.textColor = .green
    }
    
    //MARK: - button clicks
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        print("Update thai che")
    }
    
}
