//
//  SceneDelegate.swift
//  ios-exoeriments
//
//  Created by Marcus Ziadé on 26.8.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let profileEditViewController = ProfileEditViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = profileEditViewController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

