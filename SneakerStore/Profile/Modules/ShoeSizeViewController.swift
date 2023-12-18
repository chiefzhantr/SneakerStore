//
//  ShoeSizeViewController.swift
//  SneakerStore
//
//  Created by Aldiar Saparov on 17.12.2023.
//

import UIKit
import SnapKit

class ShoeSizeViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Shoe Size"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let shoeSizeTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.placeholder = "Enter your shoe size (e.g., 41.5)"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 28
        button.backgroundColor = .black
        button.setTitle("Save", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureConstraints()
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(shoeSizeTextField)
        view.addSubview(saveButton)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        shoeSizeTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(shoeSizeTextField.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(358)
            $0.height.equalTo(54)
        }
    }
    
    @objc private func saveButtonTapped() {
        guard let shoeSizeText = shoeSizeTextField.text, !shoeSizeText.isEmpty else {
            return
        }
        
        UserDefaults.standard.setValue(shoeSizeText, forKey: "shoeSize")
        shoeSizeTextField.resignFirstResponder()
        navigationController?.popToRootViewController(animated: true)
    }
}
