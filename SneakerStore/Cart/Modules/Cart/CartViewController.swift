import UIKit
import SnapKit

// MARK: - CartViewOutput

protocol CartViewOutput: AnyObject {
    var actionButtonDidTap: (() -> Void)? { get set }
}

// MARK: - CartViewController

class CartViewController: UIViewController, CartViewOutput {
    var actionButtonDidTap: (() -> Void)?
    
    private var cartShoes = [Shoes]() {
        didSet {
            updateTotalView()
        }
    }
    
    private lazy var emptyView = CartEmptyView()
    private lazy var tableView = CartTableViewFactory().makeTableView(
        dataSource: self,
        delegate: self
    )
    private lazy var totalPriceView = CartTotalPriceView()
    private lazy var actionButton = makeActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        cartShoes = ShoesService.shared.cartItems
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateEmptyViewVisibility()
    }
    
    @objc
    private func didTapActionButton() {
        let alert = UIAlertController(title: "Proceed with payment", message: "Are you sure you want to confirm?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [weak self] _ in
            self?.handleActionButton()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func handleActionButton() {
        ShoesService.shared.cartItems = []
        cartShoes = ShoesService.shared.cartItems
        updateEmptyViewVisibility()
        actionButtonDidTap?()
    }
    
    private func configureColors() {
        view.backgroundColor = Colors.grayBackground
        tableView.backgroundColor = Colors.grayBackground
        actionButton.backgroundColor = .black
    }
    
    private func setup() {
        navigationItem.title = "Cart"
        [emptyView, tableView, totalPriceView, actionButton].forEach { view.addSubview($0) }
        
        configureColors()
        setupConstraints()
    }
    
    private func setupConstraints() {
        emptyView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(totalPriceView.snp.top).offset(-12)
        }
        totalPriceView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(actionButton.snp.top).offset(-10)
        }
        actionButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-12)
        }
    }
    
    private func makeActionButton() -> UIButton {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.setTitle("Confirm Order", for: .normal)
        return button
    }
    
    private func updateEmptyViewVisibility() {
        cartShoes = ShoesService.shared.cartItems
        
        if cartShoes.isEmpty {
            emptyView.isHidden = false
            tableView.isHidden = true
            totalPriceView.isHidden = true
            actionButton.isHidden = true
        } else {
            emptyView.isHidden = true
            tableView.isHidden = false
            totalPriceView.isHidden = false
            actionButton.isHidden = false
        }
        updateTotalView()
        tableView.reloadData()
    }
    
    private func updateTotalView() {
        let totalPrice = getTotalPrice()
        
        if totalPrice == 0 {
            totalPriceView.isHidden = true
            return
        }
        
        totalPriceView.totalItems = cartShoes.count
        totalPriceView.totalPrice = totalPrice
    }
    
    private func getTotalPrice() -> Int {
        var sum: Int = 0
        cartShoes.forEach { sum += ($0.price * $0.quantity) }
        return sum
    }
}

// MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartShoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.cellIdentifier, for: indexPath) as? CartCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: cartShoes[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch cell {
        case let cell as CartCell:
            cell.delegate = self
        default:
            return
        }
    }
}

// MARK: - CartCellDelegate

extension CartViewController: CartCellDelegate {    
    func minusButtonDidTap(in cell: CartCell) {
        guard let shoes = cell.shoes else {
            return
        }
        
        ShoesService.shared.removeShoesFromCart(shoes)
        cartShoes = ShoesService.shared.cartItems
        tableView.reloadData()
    }
    
    func plusButtonDidTap(in cell: CartCell) {
        guard let shoes = cell.shoes else {
            return
        }
        
        ShoesService.shared.addShoesToCart(shoes)
        cartShoes = ShoesService.shared.cartItems
        tableView.reloadData()
    }
}
