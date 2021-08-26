import UIKit

// MARK: - Child View Controller Install methods

extension UIViewController {

    func install(_ child: UIViewController, to view: UIView, with constraints: [NSLayoutConstraint]) {
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        NSLayoutConstraint.activate(constraints)
        child.didMove(toParent: self)
    }

    func unInstall(_ child: UIViewController, with constraints: [NSLayoutConstraint]) {
        child.willMove(toParent: nil)
        child.view.removeConstraints(constraints)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

// MARK: - ViewController alerts

extension UIViewController {

    func alert(message: String? = nil, title: String) {
        DispatchQueue.main.async { [self] in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}
