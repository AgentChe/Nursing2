//
//  AppDelegate.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 16.01.2021.
//

import UIKit
import OtterScaleiOS
import RxCocoa

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NumberLaunches().launch()
        
        FacebookManager.shared.initialize(app: application, launchOptions: launchOptions)
        OtterScale.shared.initialize(host: GlobalDefinitions.otterScaleHost, apiKey: GlobalDefinitions.otterScaleApiKey)
        
        PurchaseValidationObserver.shared.startObserve()
        
        IAPManager.initialize()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        FacebookManager.shared.application(app, open: url, options: options)
        
        return true
    }
}
