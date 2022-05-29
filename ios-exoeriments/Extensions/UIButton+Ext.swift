import Foundation
import UIKit

// MARK: - UIButton.Configuration

extension UIButton.Configuration {

    /// The button config for the floating bottom button.
    /// - Parameter title: The title string to use for the button title
    static func bottomFloating(with title: String) -> Self {
        var config = UIButton.Configuration.filled()
        config.title = NSLocalizedString(title, comment: "")
        config.attributedTitle?.font = .title
        config.baseForegroundColor = .white
        config.background.backgroundColor = .systemRed
        config.cornerStyle = .capsule
        config.buttonSize = .large
        config.image = UIImage(systemName: "hand.tap")!
        return config
    }
}
