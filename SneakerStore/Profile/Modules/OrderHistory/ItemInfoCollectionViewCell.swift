//
//  ItemInfoCollectionViewCell.swift
//  SneakerStore
//
//  Created by Admin  on 18.12.2023.
//

import UIKit
import SnapKit

final class ItemInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemInfoCollectionViewCell"
    
    private let itemImageView = UIImageView()
    private let shoeName = UILabel.bold(text: "Nike", size: 13)
    private let shoeDescription = UILabel.regular(text: "24.12.2021", size: 12)
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
        
        self.contentView.addSubview(itemImageView)
        self.contentView.addSubview(shoeName)
        self.contentView.addSubview(shoeDescription)
        self.contentView.addSubview(quantityPriceLabel)
    
        self.contentView.backgroundColor = .white
        
        itemImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(140)
        }
        shoeName.snp.makeConstraints {
            $0.leading.equalTo(itemImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().inset(60)
            $0.height.equalTo(18)
        }

        shoeDescription.snp.makeConstraints {
            $0.leading.equalTo(shoeName.snp.leading)
            $0.top.equalTo(shoeName.snp.bottom).offset(2)
            $0.height.equalTo(16)
        }
        
        quantityPriceLabel.snp.makeConstraints {
            $0.leading.equalTo(shoeDescription.snp.leading)
            $0.top.equalTo(shoeDescription.snp.bottom).offset(4)
            $0.height.equalTo(16)
        }
    }
    
    func set(_ purchase: Shoes) {
        itemImageView.image = purchase.image
        shoeName.text = purchase.shoesBrand
        shoeDescription.text = purchase.shoesDescription
        quantityPriceLabel.text = "1 • $\(purchase.price)"
    }
}
