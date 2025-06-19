//
//  SceneDelegate.swift
//  ITExams
//
//  Created by Андрей Чернышев on 27.03.2025.
//

import UIKit
import AppTrackingTransparency

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SplashViewController.make()
        window?.makeKeyAndVisible()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        requestAuthorizationIfNeeded()
    }
}

// MARK: Private
private extension SceneDelegate {
    func requestAuthorizationIfNeeded() {
        guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else { return }
        
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { _ in })
    }
}
