import Foundation
import UIKit

public extension UITableView {

    final func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: NSStringFromClass(cell))
    }

    final func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ header: T.Type) {
        register(header, forHeaderFooterViewReuseIdentifier: NSStringFromClass(header))
    }

    final func dequeueCell<T: UITableViewCell>(_ cell: T.Type, forIndexPath indexPath: IndexPath!) -> T {
        dequeueReusableCell(withIdentifier: NSStringFromClass(cell), for: indexPath) as! T
    }

    final func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(_ header: T.Type) -> T {
        dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(header)) as! T
    }
}


