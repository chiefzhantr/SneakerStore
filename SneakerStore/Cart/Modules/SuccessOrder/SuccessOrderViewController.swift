import UIKit

// MARK: - SuccessOrderOutput

protocol SuccessOrderOutput: AnyObject {
    var onFinish: (() -> Void)? { get set }
}

// MARK: - SuccessOrderViewController

final class SuccessOrderViewController: UIViewController, SuccessOrderOutput {
    var onFinish: (() -> Void)?
    
    private lazy var backgroundView = makeBackgroundView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var actionButton = makeActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    @objc
    private func actionButtonDidTap() {
        onFinish?()
    }
    
    private func configureColors() {
        actionButton.backgroundColor = .black
    }
    
    private func setup() {
        view.backgroundColor = .clear
        view.addSubview(backgroundView)
        
        configureColors()
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(312)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        actionButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-32)
            make.height.equalTo(36)
        }
    }
    
    private func makeBackgroundView() -> UIView {
        let view = UIView()
        [titleLabel, actionButton].forEach { view.addSubview($0) }
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.numberOfLines = 2
        label.text = "Your order is succesfully\nplaced. Thanks!"
        label.textAlignment = .center
        return label
    }
    
    private func makeActionButton() -> UIButton {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.setTitle("Get back to shopping", for: .normal)
        return button
    }
}
