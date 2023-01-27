import UIKit

// MARK: - Subview Extensions

extension UIView {

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}


