import UIKit

final class CartTableViewFactory {
    func makeTableView(
        dataSource: UITableViewDataSource,
        delegate: UITableViewDelegate
    ) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CartCell.self, forCellReuseIdentifier: CartCell.cellIdentifier)
        return tableView
    }
}
