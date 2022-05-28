import Foundation
import UIKit
import SwiftUI

final class TestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let stackView = UIStackView(arrangedSubviews: [view1.view, view2, view3.view])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private let view1 = UIHostingController(rootView: TestView())
    private let view2: UIView = {
        let view = TestView2 {
            print("Kahen kilon siika vittu")
        }
        let hostingController = UIHostingController(rootView: view)
        return hostingController.view
    }()
    private let view3 = UIHostingController(rootView: TestView3())
}
