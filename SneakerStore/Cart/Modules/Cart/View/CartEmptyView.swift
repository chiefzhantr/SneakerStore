import UIKit

final class CartEmptyView: UIView {
    private lazy var titleLabel = makeTitleLabel()
    private lazy var subtitleLabel = makeSubtitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [titleLabel, subtitleLabel].forEach { addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.text = "Cart is empty"
        return label
    }
    
    private func makeSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.text = "Find interesting models in the Catalog."
        return label
    }
}
