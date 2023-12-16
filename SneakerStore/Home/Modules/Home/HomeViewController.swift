import UIKit
import SnapKit

// MARK: - HomeViewController

class HomeViewController: UIViewController {
    private lazy var collectionView = HomeCollectionViewFactory().makeCollectionView(
        dataSource: self,
        delegate: self
    )
    
    private var shoes = [Shoes]()
    private let shoesService = ShoesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupServices()
        shoes = shoesService.getAllShoes()
    }
    
    private func configureColors() {
        view.backgroundColor = Colors.grayBackground
        collectionView.backgroundColor = Colors.grayBackground
    }
    
    private func setup() {
        navigationItem.title = "Hello, Sneakerhead!"
        view.addSubview(collectionView)
        
        configureColors()
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(
                UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
            )
        }
    }
    
    private func setupServices() {
        shoesService.delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoesCell.cellIdentifier, for: indexPath) as! ShoesCell
        cell.configure(
            with: ShoesCellViewModel(shoes: shoes[indexPath.item])
        )
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shoes.count
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate { }

// MARK: - ShoesServiceDelegate

extension HomeViewController: ShoesServiceDelegate {
    func cartDidUpdate(in service: ShoesService) {
        collectionView.reloadData()
    }
}

// MARK: - ShoesCellDelegate

extension HomeViewController: ShoesCellDelegate {
    func shoesCell(didTapActionButton button: UIButton, with shoes: Shoes) {
        shoes.isAdded
            ? shoesService.removeShoesFromCart(shoes)
            : shoesService.addShoesToCart(shoes)
        shoes.isAdded = !shoes.isAdded
    }
}
