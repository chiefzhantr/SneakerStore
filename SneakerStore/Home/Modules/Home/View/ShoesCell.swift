import UIKit
import SnapKit

protocol ShoesCellDelegate: AnyObject {
    func shoesCell(
        didTapActionButton button: UIButton,
        with shoes: Shoes
    )
}

// MARK: - ShoesCell

class ShoesCell: UICollectionViewCell {
    static let cellIdentifier = "ShoesCell"
    
    var shoes: Shoes?
    weak var delegate: ShoesCellDelegate?
    
    private lazy var containerView = makeContainerView()
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var subtitleLabel = makeSubtitleLabel()
    private lazy var priceLabel = makePriceLabel()
    private lazy var actionButton = makeActionButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc
    private func actionButtonDidTap() {
        guard let shoes else {
            return
        }
        
        delegate?.shoesCell(didTapActionButton: actionButton, with: shoes)
    }
    
    func configure(with viewModel: ShoesCellViewModel) {
        shoes = viewModel.shoes
        imageView.image = nil
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        priceLabel.text = viewModel.price
        actionButton.setTitle(viewModel.actionButtonTitle, for: .normal)
        actionButton.backgroundColor = viewModel.actionButtonBackgroundColor
    }
    
    private func configureColors() {
        backgroundColor = .white
        titleLabel.textColor = .black
        subtitleLabel.textColor = Colors.basicGray
        actionButton.backgroundColor = .black
    }
    
    private func setup() {
        layer.cornerRadius = 4
        contentView.addSubview(containerView)
        
        configureColors()
        setupConstraints()
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(
                UIEdgeInsets(top: 0, left: 4, bottom: 12, right: 4)
            )
        }
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(166)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        actionButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(36)
        }
    }
    
    private func makeContainerView() -> UIView {
        let view = UIView()
        [
            imageView,
            titleLabel,
            subtitleLabel,
            priceLabel,
            actionButton
        ].forEach { view.addSubview($0) }
        return view
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }
    
    private func makeSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }
    
    private func makePriceLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }
    
    private func makeActionButton() -> UIButton {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 16
        return button
    }
}
