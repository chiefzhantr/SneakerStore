import UIKit

class CartTotalPriceView: UIView {
    var totalItems: Int? {
        didSet {
            guard let totalItems = totalItems else {
                return
            }
            
            totalLabel.text = "\(totalItems) items: Total (Including Delivery)"
        }
    }
    
    var totalPrice: Int? {
        didSet {
            guard let totalPrice = totalPrice else {
                return
            }
            
            totalPriceLabel.text = "$\(totalPrice)"
        }
    }
    
    private lazy var stackView = makeStackView()
    private lazy var totalLabel = makeTotalLabel()
    private lazy var totalPriceLabel = makeTotalPriceLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .white.withAlphaComponent(0.98)
        addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(
                UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            )
        }
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView(
            arrangedSubviews: [totalLabel, totalPriceLabel]
        )
        stackView.spacing = 10
        return stackView
    }
    
    private func makeTotalLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }
    
    private func makeTotalPriceLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }
}
