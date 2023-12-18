//
//  OrderHistoryCollectionViewCell.swift
//  SneakerStore
//
//  Created by Admin  on 17.12.2023.
//

import UIKit
import SnapKit

final class OrderHistoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "OrderHistoryCollectionViewCell"
    
    private let itemImageView = UIImageView()
    private let goArrow = UIImageView()
    private let orderNumberLabel = UILabel.bold(text: "Order #123", size: 17)
    private let dateLabel = UILabel.regular(text: "24.12.2021", size: 12)
    private let quantityPriceLabel = UILabel.bold(text: "1 item • $1234", size: 12)
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helpers
    private func configureViews() {
        
        let itemImageBackView = UIView()
        self.contentView.addSubview(itemImageBackView)
        itemImageBackView.addSubview(itemImageView)
        
        self.contentView.addSubview(goArrow)
        self.contentView.addSubview(orderNumberLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(quantityPriceLabel)
        
        self.contentView.backgroundColor = .white
        itemImageBackView.backgroundColor = .systemGray4
        
        itemImageBackView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(120)
        }
        
        itemImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(64)
        }
        orderNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(itemImageBackView.snp.trailing).offset(10)
            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }

        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(orderNumberLabel.snp.leading)
            $0.top.equalTo(orderNumberLabel.snp.bottom).offset(2)
            $0.height.equalTo(16)
        }
        
        quantityPriceLabel.snp.makeConstraints {
            $0.leading.equalTo(orderNumberLabel.snp.leading)
            $0.top.equalTo(dateLabel.snp.bottom).offset(12)
            $0.height.equalTo(16)
        }
        
        goArrow.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(8)
            $0.height.equalTo(14)
        }
    }
    
    func set(_ purchase: Shoes) {
        guard let orderNumber = purchase.orderNumber, let date = purchase.purchaseDate else {
            return
        }
        goArrow.image = UIImage(named: "arrow")
        itemImageView.image = purchase.image
        orderNumberLabel.text = "Order #\(orderNumber)"
        dateLabel.text = date
        quantityPriceLabel.text = purchase.getPriceQuantity()
    }
    
}
