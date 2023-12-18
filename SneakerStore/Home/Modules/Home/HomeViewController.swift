import UIKit
import SnapKit

// MARK: - HomeViewController

class HomeViewController: UIViewController {
    private var shoes = [Shoes]()
    
    private lazy var collectionView = HomeCollectionViewFactory().makeCollectionView(
        dataSource: self,
        delegate: self
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        shoes = ShoesService.shared.allShoes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.reloadData()
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

// MARK: - ShoesCellDelegate

extension HomeViewController: ShoesCellDelegate {
    func shoesCell(didTapActionButton button: UIButton, with shoes: Shoes) {
        shoes.isAdded
            ? ShoesService.shared.removeShoesFromCart(shoes)
            : ShoesService.shared.addShoesToCart(shoes)
        
        collectionView.reloadData()
    }
}
