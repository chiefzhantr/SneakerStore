//
//  AuthorizationViewController.swift
//  SneakerStore
//
//  Created by Admin  on 16.12.2023.
//

import UIKit
import SnapKit

class AuthorizationViewController: UIViewController {

    //MARK: Properties
    private let usernameField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Username"
        return tf
    }()
    
    private let passwordField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Password"
        return tf
    }()
    
    private let passwordRepeatField : UITextField = {
        let tf = UITextField()
        tf.isHidden = true
        tf.borderStyle = .roundedRect
        tf.placeholder = "Repeat password"
        return tf
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    private let actionButton = UIButton.cornered(titleText: "")
    
    var accountService : AccountService?
    var authType : AuthorizationType
    
    //MARK: LifeCycle
    init(authType: AuthorizationType) {
        self.authType = authType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch authType {
            case .signIn:
                configureForSignIn()
            case .signUp:
                configureForSignUp()
        }
        
    }
    
    //MARK: Helpers
    private func configureForSignIn() {
        self.title = "Welcome Back!"
        actionButton.setTitle("Sign In", for: .normal)
        actionButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        configureViews()
    }
    
    private func configureForSignUp() {
        self.title = "New User"
        actionButton.setTitle("Sign Up", for: .normal)
        actionButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        passwordRepeatField.isHidden = false
        configureViews()
    }
    
    private func configureViews() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(passwordRepeatField)
        self.view.addSubview(actionButton)
        self.view.addSubview(statusLabel)
        
        self.usernameField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(52+86)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        self.passwordField.snp.makeConstraints {
            $0.top.equalTo(usernameField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        self.passwordRepeatField.snp.makeConstraints {
            $0.top.equalTo(passwordField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        self.actionButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
            $0.bottom.equalToSuperview().inset(58)
        }
        
        self.statusLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func signIn() {
        guard let accountService = accountService, let username = usernameField.text, !username.isEmpty, let password = passwordField.text, !password.isEmpty else {
            statusLabel.text = "Username or password is wrong!"
            return
        }
        if accountService.checkUser(username: username, password: password) {
            navigateToMainView()
        } else {
            statusLabel.text = "Username or password is wrong!"
        }
    }
    
    @objc func signUp() {
        guard let username = usernameField.text, !username.isEmpty, let password = passwordField.text, !password.isEmpty, let passwordRepeat = passwordField.text, !passwordRepeat.isEmpty else {
            statusLabel.text = "Not all fields are filled!"
            return
        }
        guard password == passwordRepeat else {
            statusLabel.text = "Passwords are different!"
            return
        }
        accountService?.createUser(username: username, password: password)
        navigateToMainView()
    }
    
    private func navigateToMainView() {
        let navigationController = UINavigationController()
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator.start()
        navigationController.modalTransitionStyle = .flipHorizontal
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController,animated: true)
    }
}


enum AuthorizationType {
    case signIn
    case signUp
}
