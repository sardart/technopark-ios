//
//  AppDelegate.swift
//  stateControl
//
//  Created by Artur on 25/09/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var prevState: UIApplicationState?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        appStateControl(currentState: UIApplication.shared.applicationState, methodName: #function)
        return true
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        appStateControl(currentState: UIApplication.shared.applicationState, methodName: #function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        appStateControl(currentState: UIApplication.shared.applicationState, methodName: #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        appStateControl(currentState: UIApplication.shared.applicationState, methodName: #function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        appStateControl(currentState: UIApplication.shared.applicationState, methodName: #function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        appStateControl(currentState: UIApplication.shared.applicationState, methodName: #function)
    }
    
    
}


extension AppDelegate {
    
    func appStateControl(currentState: UIApplicationState, methodName: String) {
        let prevStateString = getAppStateString(for: prevState)
        let currentStateString = getAppStateString(for: currentState)
        
        if currentStateString != prevStateString {
            print("Method '\(methodName)' called. Application state changed from '\(prevStateString)' to '\(currentStateString)'")
        } else {
            print("Method '\(methodName)' called. Application state is '\(currentStateString)'")
        }
        
        prevState = currentState
    }
    
    func getAppStateString(for state: UIApplicationState?) -> String {
        // nil передастся сюда только при первом вызове функции appStateControl, когда prevState == nil
        // это соответствует переходу из состояния Not running
        guard let state = state else {
            return "Not running"
        }
        
        switch state {
        case .active:
            return "Active"
        case .background:
            return "Background"
        case .inactive:
            return "Inactive"
        }
    }
    
    
}

