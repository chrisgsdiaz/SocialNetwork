//
//  AppDelegate.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 28/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        let welcomeVC = WelcomeViewController()
        welcomeVC.view.frame = self.window!.frame
        self.window?.rootViewController = UINavigationController(rootViewController: welcomeVC)
        self.window?.makeKeyAndVisible()
        /*
        let storyboard = UIStoryboard(name: "Welcome", bundle: Bundle.main)
        let viewController = storyboard.instantiateInitialViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
         */
        return true
    }


}

