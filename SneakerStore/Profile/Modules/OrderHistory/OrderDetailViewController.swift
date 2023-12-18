//
//  OrderDetailViewController.swift
//  SneakerStore
//
//  Created by Admin  on 18.12.2023.
//

import UIKit
import SnapKit

final class OrderDetailViewController: UIViewController {

    private let orderedView = UIView()
    private let orderedLabel = UILabel.regular(text: "Ordered",textAlign: .left, size: 13)
    private let orderedDateLabel = UILabel.bold(text: "",textAlign: .right, size: 13)
    private let itemsView = UIView()
    private let itemsQuantityLabel = UILabel.regular(text: "",textAlign: .left, size: 13)
    private let itemsPriceLabel = UILabel.bold(text: "",textAlign: .right, size: 13)
    private let itemsInfoCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 390, height: 160)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Colors.grayBackground
        return collectionView
    }()
    
    public var order: Shoes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order Detail"
        self.view.backgroundColor = Colors.grayBackground
        configureViews()
    }
    
    private func configureViews() {
        guard let order = order else {
            return
        }
    
        itemsInfoCollectionView.dataSource = self
        itemsInfoCollectionView.register(ItemInfoCollectionViewCell.self, forCellWithReuseIdentifier: ItemInfoCollectionViewCell.identifier)
        
        orderedDateLabel.text = order.purchaseDate
        itemsQuantityLabel.text = "\(order.quantity) items: Total (Including Delivery)"
        itemsPriceLabel.text = "$\(order.price * order.quantity)"
        orderedView.backgroundColor = .white
        itemsView.backgroundColor = .white
        
        self.view.addSubview(orderedView)
        self.orderedView.addSubview(orderedLabel)
        self.orderedView.addSubview(orderedDateLabel)
        self.view.addSubview(itemsView)
        self.itemsView.addSubview(itemsQuantityLabel)
        self.itemsView.addSubview(itemsPriceLabel)
        self.view.addSubview(itemsInfoCollectionView)
    
        orderedView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16+86)
            $0.height.equalTo(50)
        }
        
        orderedLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(214)
            $0.height.equalTo(18)
        }
        
        orderedDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(134)
            $0.height.equalTo(18)
        }
        
        itemsView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(orderedView.snp.bottom).offset(16)
            $0.height.equalTo(50)
        }
        
        itemsQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(214)
            $0.height.equalTo(18)
        }
        
        itemsPriceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(134)
            $0.height.equalTo(18)
        }
        
        itemsInfoCollectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(itemsView.snp.bottom).offset(16)
        }
    }
}

extension OrderDetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return order?.quantity ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let order = order, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemInfoCollectionViewCell.identifier, for: indexPath) as? ItemInfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(order)
        return cell
    }
}
