//
//  AppDelegate.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 02/03/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        resetToMainStoryboard()
        return true
    }

}


extension AppDelegate {
    
    func resetToMainStoryboard() {
        // Get the main storyboard from the app bundle
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MoviesListViewController()
        window?.makeKeyAndVisible()
    }
}
