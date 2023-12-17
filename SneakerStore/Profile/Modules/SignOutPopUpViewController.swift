//
//  SignOutPopUpViewController.swift
//  SneakerStore
//
//  Created by Aldiar Saparov on 16.12.2023.
//

import UIKit

class SignOutPopUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let popUpView = UIView()
        popUpView.backgroundColor = .white
        popUpView.layer.cornerRadius = 10
        view.addSubview(popUpView)
        
//        popUpView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            popUpView.widthAnchor.constraint(equalToConstant: 300),
//            popUpView.heightAnchor.constraint(equalToConstant: 150)
//        ])
        
        popUpView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(270)
            make.height.equalTo(120)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "Are you sure you want to sign out?"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        popUpView.addSubview(titleLabel)
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -16)
//        ])
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
        let cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        popUpView.addSubview(cancelButton)
        
//        cancelButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            cancelButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -20),
//            cancelButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 40)
//        ])
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(40)
        }
        
        let confirmButton = UIButton()
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        popUpView.addSubview(confirmButton)
        
//        confirmButton.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//            confirmButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -20),
//            confirmButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -40)
//        ])
        
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-40)
        }
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func confirmButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
