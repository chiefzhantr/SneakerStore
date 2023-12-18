//
//  ProfileViewController.swift
//  SneakerStore
//
//  Created by Zhantore on 13.12.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private let accountService = AccountService()
    
    let colors = Colors()
    
    private let accountInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Account Information"
        return label
    }()
    
    private let orderHistoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Order History"
        return label
    }()
    
    private let shoeSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Shoe size"
        return label
    }()
    
    private let knowSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "How to know your shoe size?"
        return label
    }()
    
    private let shoeAuthLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "How to check the authenticity of the shoe?"
        return label
    }()
    
    private let accountInfoArrow: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(named: "arrow")
        return arrow
    }()
    
    private let orderHistoryArrow: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(named: "arrow")
        return arrow
    }()
    
    private let shoeSizeArrow: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(named: "arrow")
        return arrow
    }()
    
    private let knowSizeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "icon")
        return icon
    }()
    
    private let shoeAuthIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "icon")
        return icon
    }()
    
    private let shoeSizeNumber: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        return label
    }()
    
    private let signOutBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 28
        btn.backgroundColor = .black
        btn.setTitle("Sign Out", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight:.bold)
        return btn
    }()
    
    
    private let accountInfoView = UIView()
    private let orderHistoryView = UIView()
    private let shoeSizeView = UIView()
    private let knowSizeView = UIView()
    private let shoeAuthView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signOutBtn.addTarget(self, action: #selector(signOutAction), for:.touchUpInside)

        setupUI()
        
        title = "Profile"
        self.view.backgroundColor = .white
        self.view.backgroundColor = Colors.grayBackground
        shoeSizeNumber.textColor = Colors.basicGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shoeSizeNumber.text = UserDefaults.standard.string(forKey: "shoeSize")
    }
    
    private func setupUI() {
        createAccountInformationSection()
        createOrderHistorySection()
        createShoeSizeSection()
        createKnowSize()
        createShoeAuth()
    }
    
    private func createAccountInformationSection() {
        view.addSubview(accountInfoView)
        accountInfoView.addSubview(accountInfoLabel)
        accountInfoView.addSubview(accountInfoArrow)
        
        accountInfoView.layer.cornerRadius = 12
        
        accountInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26+86)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        accountInfoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        accountInfoArrow.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
        
    
        accountInfoView.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToAccountInfo))
        accountInfoView.addGestureRecognizer(tapGesture)
    }
    
    private func createOrderHistorySection() {
        view.addSubview(orderHistoryView)
        orderHistoryView.addSubview(orderHistoryLabel)
        orderHistoryView.addSubview(orderHistoryArrow)
        
        orderHistoryView.layer.cornerRadius = 12
        
        orderHistoryView.snp.makeConstraints {
            $0.top.equalTo(accountInfoView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        orderHistoryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        orderHistoryArrow.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
        
        orderHistoryView.backgroundColor = .white
    }
    
    private func createShoeSizeSection() {
        view.addSubview(shoeSizeView)
        shoeSizeView.addSubview(shoeSizeLabel)
        shoeSizeView.addSubview(shoeSizeArrow)
        shoeSizeView.addSubview(shoeSizeNumber)
        
        shoeSizeView.layer.cornerRadius = 12
        
        shoeSizeView.snp.makeConstraints {
            $0.top.equalTo(orderHistoryView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        shoeSizeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        shoeSizeNumber.textAlignment = .left
        shoeSizeNumber.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(shoeSizeArrow.snp.leading).offset(-12)
            $0.width.equalTo(38)
            $0.height.equalTo(22)
        }
        
        shoeSizeArrow.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
        
        shoeSizeView.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToShoeSizeSelection))
        shoeSizeView.addGestureRecognizer(tapGesture)
    }
    
    private func createKnowSize() {
        view.addSubview(knowSizeView)
        knowSizeView.addSubview(knowSizeLabel)
        knowSizeView.addSubview(knowSizeIcon)
        
        knowSizeView.layer.cornerRadius = 12
        
        knowSizeView.snp.makeConstraints {
            $0.top.equalTo(shoeSizeView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        knowSizeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        knowSizeIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        knowSizeView.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openShoeSizeGuide))
        knowSizeView.addGestureRecognizer(tapGesture)
    }
    
    private func createShoeAuth() {
        view.addSubview(shoeAuthView)
        shoeAuthView.addSubview(shoeAuthLabel)
        shoeAuthView.addSubview(shoeAuthIcon)
        view.addSubview(signOutBtn)
        
        shoeAuthView.layer.cornerRadius = 12
        
        shoeAuthView.snp.makeConstraints {
            $0.top.equalTo(knowSizeView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        shoeAuthLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(44)
            $0.width.equalTo(260)
        }
        
        shoeAuthIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        signOutBtn.snp.makeConstraints {
            $0.top.equalTo(shoeAuthView.snp.bottom).offset(230)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(358)
            $0.height.equalTo(54)
        }
    
        shoeAuthView.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openShoeAuth))
        shoeAuthView.addGestureRecognizer(tapGesture)
    }
    
    
    
    
    @objc func signOutAction(){
        let alert = UIAlertController(title: "Sign Out", message: "Are you sure you want to confirm?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [weak self] _ in
            self?.accountService.signOut()
            let navigationController = UINavigationController(rootViewController: OnboardingViewController())
            navigationController.navigationBar.tintColor = .black
            navigationController.modalPresentationStyle = .fullScreen
            self?.present(navigationController, animated: true)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func goToShoeSizeSelection() {
        let shoeSizeViewController = ShoeSizeViewController()
        navigationController?.pushViewController(shoeSizeViewController, animated: true)
    }
    
    @objc private func goToAccountInfo() {
        let accountInfoViewController = AccountInfoViewController()
        navigationController?.pushViewController(accountInfoViewController, animated: true)
    }
    
    @objc private func openShoeSizeGuide() {
        if let url = URL(string: "https://www.chikoshoes.com/wp-content/uploads/2018/04/chiko-shoe-size-180427-1.jpg") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func openShoeAuth() {
        if let url = URL(string: "https://sneakersjoint.com/en/blog/how-to-know-whether-neakers-are-original-or-fake/?v=4aceb7d6b456#:~:text=Inside%20the%20shoe%20under%20the,also%20known%20as%20the%20SKU.") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
