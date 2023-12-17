//
//  AccountInfoViewController.swift
//  SneakerStore
//
//  Created by Aldiar Saparov on 17.12.2023.
//

import UIKit
import SnapKit

class AccountInfoViewController: UIViewController {
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
//    private let confirmPasswordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Confirm Password"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
    
    private let saveChangesButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 28
        button.setTitle("Save Changes", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        title = "Account Info"
        
        saveChangesButton.addTarget(self, action: #selector(saveChangesButtonTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
//        view.addSubview(confirmPasswordTextField)
        view.addSubview(saveChangesButton)
        
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(86+26)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
        
//        confirmPasswordTextField.snp.makeConstraints {
//            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(52)
//        }
        
        saveChangesButton.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(120)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(358)
            $0.height.equalTo(54)
        }
        

    }
    
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    @objc private func saveChangesButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty else {
            showAlert(message: "Please enter a valid username.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter a valid password.")
            return
        }
        
//        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
//            showAlert(message: "Please confirm your password.")
//            return
//        }
        
//        guard password == confirmPassword else {
//            showAlert(message: "Passwords do not match.")
//            return
//        }
        
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
