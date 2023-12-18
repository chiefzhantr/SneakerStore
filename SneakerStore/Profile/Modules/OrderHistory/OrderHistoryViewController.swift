//
//  OrderHistoryViewController.swift
//  SneakerStore
//
//  Created by Admin  on 17.12.2023.
//

import UIKit
import SnapKit

final class OrderHistoryViewController: UIViewController {

    private let myShoes = ShoesService.shared.buyHistory
    
    private let historyCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 390, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Colors.grayBackground
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Order History"
        self.view.backgroundColor = Colors.grayBackground
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        configureCollectionView()
    }
    
    
    private func configureCollectionView() {
        self.view.addSubview(historyCollectionView)
        
        historyCollectionView.delegate = self
        historyCollectionView.dataSource = self
        historyCollectionView.register(OrderHistoryCollectionViewCell.self, forCellWithReuseIdentifier: OrderHistoryCollectionViewCell.identifier)
        
        historyCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(86+16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension OrderHistoryViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShoesService.shared.buyHistory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderHistoryCollectionViewCell.identifier, for: indexPath) as? OrderHistoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(myShoes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let orderDetailVC = OrderDetailViewController()
        orderDetailVC.order = myShoes[indexPath.row]
        self.navigationController?.pushViewController(orderDetailVC, animated: true)
    }
}
