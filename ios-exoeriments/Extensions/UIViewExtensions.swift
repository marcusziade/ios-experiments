import UIKit

// MARK: - For auto layout

extension UIView {

    /// Sets translatesAutoresizingMaskIntoConstraints = false for given UIView.
    /// - Returns: Retuns Self and enables chaining. Example: let view = UIView().forAutoLayout()
    func forAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

// MARK: - Animations

extension UIView {

    // Fades a view in linearly with a given duration
    func fadeIn(duration: TimeInterval) {
        UIViewPropertyAnimator(duration: duration, curve: .linear) {
            self.alpha = 1
        }.startAnimation()
    }

    // Fades a view out linearly with a given duration
    func fadeOut(duration: TimeInterval) {
        UIViewPropertyAnimator(duration: duration, curve: .linear) {
            self.alpha = 0
        }.startAnimation()
    }
}
