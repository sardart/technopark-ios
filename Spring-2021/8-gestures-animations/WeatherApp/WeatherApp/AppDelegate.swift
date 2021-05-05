//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 3/22/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        
        let container = CitiesModuleContainer.assemle()
        let viewController = container.viewControler
        
        window.rootViewController = UINavigationController(rootViewController: viewController)
        
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }

}

