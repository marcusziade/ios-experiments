import Foundation
import UIKit

final class NavigationController: UINavigationController {

    convenience init(
        root: UIViewController
    ) {
        self.init(rootViewController: root)
    }

    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }

    override func viewDidLoad() {
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
}
