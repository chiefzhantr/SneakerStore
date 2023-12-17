//
//  AuthorizationViewController.swift
//  SneakerStore
//
//  Created by Admin  on 16.12.2023.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {

    //MARK: Properties
    private let backgroundImageView = UIImageView(image: UIImage(named: "welcome") ?? UIImage())
    private let bottomView = UIView()
    private let titleLabel = UILabel.bold(text: "Welcome to the biggest sneakers store app", size: 28)
    private let signUpButton = UIButton.cornered(titleText: "Sign Up")
    private let signInButton = UIButton.cornered(titleText: "Sign In")
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        configureViews()
    }
    
    //MARK: Helpers
    private func configureViews() {
        self.view.backgroundColor = .white
        
        self.signInButton.setTitleColor(.black, for: .normal)
        self.signInButton.backgroundColor = .white
        
        self.signInButton.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(bottomView)
        self.bottomView.addSubview(titleLabel)
        self.bottomView.addSubview(signUpButton)
        self.bottomView.addSubview(signInButton)
        
        self.backgroundImageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(560)
        }
        self.bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(backgroundImageView.snp.bottom)
        }
        self.titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(18)
            $0.height.equalTo(68)
        }
        self.signUpButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.height.equalTo(52)
        }
        self.signInButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(signUpButton.snp.bottom).offset(8)
            $0.height.equalTo(52)
        }
    }
    
    @objc private func goToSignIn() {
        let vc = AuthorizationViewController(authType: .signIn)
        vc.accountService = AccountService()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func goToSignUp() {
        let vc = AuthorizationViewController(authType: .signUp)
        vc.accountService = AccountService()
        navigationController?.pushViewController(vc, animated: true)
    }
}
