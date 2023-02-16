import Foundation
import UIKit

class ContainerViewController: UIViewController, UIScrollViewDelegate {
    let firstViewController = FirstViewController()
    let secondViewController = SecondViewController()
    var currentViewController: UIViewController?
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the scroll view to the main view
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        // Add the first view controller
        addChild(firstViewController)
        scrollView.addSubview(firstViewController.view)
        firstViewController.view.translatesAutoresizingMaskIntoConstraints = false
        firstViewController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        firstViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        firstViewController.view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        firstViewController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        firstViewController.didMove(toParent: self)
        currentViewController = firstViewController
        
        // Add the second view controller
        addChild(secondViewController)
        scrollView.addSubview(secondViewController.view)
        secondViewController.view.translatesAutoresizingMaskIntoConstraints = false
        secondViewController.view.leadingAnchor.constraint(equalTo: firstViewController.view.trailingAnchor).isActive = true
        secondViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        secondViewController.view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        secondViewController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        secondViewController.didMove(toParent: self)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        switchToPage(pageIndex: Int(pageIndex))
    }
    
    func switchToPage(pageIndex: Int) {
        if pageIndex == 0 {
            // Switch to the first view controller
            switchToViewController(viewController: firstViewController)
        } else if pageIndex == 1 {
            // Switch to the second view controller
            switchToViewController(viewController: secondViewController)
        }
    }
    
    func switchToViewController(viewController: UIViewController) -> Void {
        if currentViewController != viewController {
            addChild(viewController)
            viewController.view.alpha = 0
            scrollView.addSubview(viewController.view)
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            viewController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(scrollView.subviews.count - 1) * view.frame.width).isActive = true
            viewController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            viewController.view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            viewController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            viewController.didMove(toParent: self)
            
            UIView.animate(withDuration: 0.3) {
                viewController.view.alpha = 1
                self.currentViewController?.view.alpha = 0
            } completion: { completed in
                self.currentViewController?.willMove(toParent: nil)
                self.currentViewController?.view.removeFromSuperview()
                self.currentViewController?.removeFromParent()
                self.currentViewController = viewController
            }
        }
    }
}

#if DEBUG

import SwiftUI

struct ContainerViewController_Preview: PreviewProvider {
    static var previews: some View = Preview(for: ContainerViewController())
}

#endif

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = view.center
        label.textAlignment = .center
        label.text = "First View Controller"
        view.addSubview(label)
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = view.center
        label.textAlignment = .center
        label.text = "Second View Controller"
        view.addSubview(label)
    }
}
