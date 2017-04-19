//
//  AppDelegate.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/9/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // change this to use Reals instead
        Bootstrap().registerFakes()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let navController = storyboard.instantiateInitialViewController() as? UINavigationController {
            let viewController = navController.topViewController as? ViewController
            let persistance = resolver.resolve() as Persistance?
            let client = resolver.resolve() as Client?
            viewController?.weatherDataSource = WeatherDataSource(persistance: persistance!, client: client!)
            self.window?.rootViewController = navController
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataHelper.sharedInstance.saveContext()
    }
    
    let resolver = DependencyResolver.sharedResolver
}

