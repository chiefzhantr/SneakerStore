import UIKit
import SnapKit

// MARK: - CartCellActionButtonDelegate

protocol CartCellActionButtonDelegate: AnyObject {
    func plusButtonDidTap()
    func minusButtonDidTap()
}

// MARK: - CartCellActionButton

class CartCellActionButton: UIView {
    public var cellQuantity: Int? {
        didSet {
            guard let quantity = cellQuantity else { return }
            quantityLabel.text = "\(quantity)"
        }
    }
    weak var delegate: CartCellActionButtonDelegate?
    
    private lazy var stackView = makeStackView()
    private lazy var quantityLabel = makeQuantityLabel()
    private lazy var minusButton = makeMinusButton()
    private lazy var plusButton = makePlusButton()
    
    init(delegate: CartCellActionButtonDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func minusButtonDidTap() {
        delegate?.minusButtonDidTap()
    }
    
    @objc
    private func plusButtonDidTap() {
        delegate?.plusButtonDidTap()
    }
    
    private func setup() {
        backgroundColor = .black
        layer.cornerRadius = 18
        addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-6)
        }
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        stackView.axis = .horizontal
        stackView.isUserInteractionEnabled = true
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }
    
    private func makeQuantityLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }
    
    private func makePlusButton() -> UIButton {
        let button = UIButton()
        button.addTarget(self, action: #selector(plusButtonDidTap), for: .touchUpInside)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        return button
    }
    
    private func makeMinusButton() -> UIButton {
        let button = UIButton()
        button.addTarget(self, action: #selector(minusButtonDidTap), for: .touchUpInside)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        return button
    }
}
