//
//  EditProfileViewController.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 13/06/22.
//

import UIKit

class EditProfileViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    //MARK: - initialize
    private func initialize() {
       initializeView()
        setUpTextField(textField: firstNameTextField)
        setUpTextField(textField: lastNameTextField)
        setUpTextField(textField: emailTextField)
        setUpTextField(textField: phoneNumberTextField)
        setUpButton()
    }
    //MARK: - initializeView
    private func initializeView() {
        navigationController?.isNavigationBarHidden = true
    }
    //MARK: - setUp TextField
    private func setUpTextField(textField: UITextField) {
        textField.set(cornerRadius: 4)
        textField.set(borderColor: .black, borderWidth: 0.9)
        textField.tintColor = #colorLiteral(red: 0.125, green: 0.2509999871, blue: 0.3179999888, alpha: 1)
        textField.text?.trimmed
    }
    //MARK: - setUp Button
    private func setUpButton() {
        saveButton.set(cornerRadius: 8)
        saveButton.titleLabel?.textColor = .green
    }
    
    //MARK: - button Clicks
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        print("Save thai che")
    }
}
