import UIKit
import SnapKit

// MARK: - CartCellDelegate

protocol CartCellDelegate: AnyObject {
    func minusButtonDidTap(in cell: CartCell)
    func plusButtonDidTap(in cell: CartCell)
}

// MARK: - CartCell

final class CartCell: UITableViewCell {
    public static let cellIdentifier = "CartCell"
    
    var shoes: Shoes?
    weak var delegate: CartCellDelegate?
    
    private lazy var mainContainerView = makeMainContainerView()
    private lazy var containerView = makeContainerView()
    private lazy var stackView = makeStackView()
    private lazy var shoesImageView = UIImageView()
    private lazy var infoStackView = makeInfoStackView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var subtitleLabel = makeSubtitleLabel()
    private lazy var priceLabel = makePriceLabel()
    private lazy var actionButton = CartCellActionButton(delegate: self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(with shoes: Shoes) {
        self.shoes = shoes
        shoesImageView.image = shoes.image
        titleLabel.text = shoes.shoesBrand
        subtitleLabel.text = shoes.shoesDescription
        priceLabel.text = "$\(shoes.price)"
        actionButton.cellQuantity = shoes.quantity
    }
    
    private func configureColors() {
        backgroundColor = .clear
        mainContainerView.backgroundColor = .white
        actionButton.backgroundColor = .black
    }
    
    private func setup() {
        selectionStyle = .none
        contentView.addSubview(mainContainerView)
        
        configureColors()
        setupConstraints()
    }
    
    private func setupConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(
                UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
            )
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        shoesImageView.snp.makeConstraints { make in
            make.size.equalTo(140)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        actionButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview()
            make.height.equalTo(36)
        }
    }
    
    private func makeMainContainerView() -> UIView {
        let view = UIView()
        view.addSubview(containerView)
        return view
    }
    
    private func makeContainerView() -> UIView {
        let view = UIView()
        view.addSubview(stackView)
        return view
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [shoesImageView, infoStackView])
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }
    
    private func makeInfoStackView() -> UIStackView {
        let stackView = UIStackView(
            arrangedSubviews: [titleLabel, subtitleLabel, priceLabel, actionButton]
        )
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.setCustomSpacing(4, after: subtitleLabel)
        stackView.setCustomSpacing(10, after: priceLabel)
        return stackView
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
        button.layer.cornerRadius = 16
        return button
    }
}

// MARK: - CartCellActionButtonDelegate

extension CartCell: CartCellActionButtonDelegate {
    func plusButtonDidTap() {
        delegate?.plusButtonDidTap(in: self)
    }
    
    func minusButtonDidTap() {
        delegate?.minusButtonDidTap(in: self)
    }
}
