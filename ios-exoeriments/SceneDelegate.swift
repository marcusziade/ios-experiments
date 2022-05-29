//
//  SceneDelegate.swift
//  ios-exoeriments
//
//  Created by Marcus Ziadé on 26.8.2021.
//

import Foundation
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let profileEditViewController = ProfileEditViewController()
    private let swiftUIUIKitTestVC = TestVC()
    private let showcaseVC = ShowcaseVC()

    func scene(
        _ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = NavigationController(root: showcaseVC)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
