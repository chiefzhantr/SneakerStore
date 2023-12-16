import UIKit

final class HomeCollectionViewFactory {
    func makeCollectionView(
        dataSource: UICollectionViewDataSource,
        delegate: UICollectionViewDelegate
    ) -> UICollectionView {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionViewLayout()
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(ShoesCell.self, forCellWithReuseIdentifier: ShoesCell.cellIdentifier)
        return collectionView
    }
    
    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 10
        collectionViewLayout.minimumLineSpacing = 10

        let collectionViewWidth = UIScreen.main.bounds.width
        let itemsPerRow: CGFloat = 2
        let spacingBetweenItems: CGFloat = 10
        let totalSpacing = (itemsPerRow - 1) * spacingBetweenItems
        let itemWidth = (collectionViewWidth - totalSpacing - 40) / itemsPerRow

        collectionViewLayout.itemSize = CGSize(width: itemWidth, height: 300)
        return collectionViewLayout
    }
}
