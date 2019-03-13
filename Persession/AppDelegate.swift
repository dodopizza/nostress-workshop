//
//  AppDelegate.swift
//  Persession
//
//  Created by Олег Кузьмин on 2019-03-12.
//  Copyright © 2019 Dodo Pizza. All rights reserved.
//

import UIKit
import Dip


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow!
    var container: DependencyContainer!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        container = DependencyContainer()

        container.register {
            PairSessionRepository() as PairSessionRepositoryProtocol
        }

        container.register {
            PairSessionService(pairSessionRepository: try self.container.resolve()) as PairSessionServiceProtocol
        }

        let startModule = DependencyContainer { container in
            container
                    .register {
                        StartViewController()
                    }
                    .resolvingProperties { (container, controller) in
                        controller.presenter = try container.resolve()
                    }
            container
                    .register {
                StartPresenter(pairSessionService: try self.container.resolve()) as StartPresenterProtocol
            }
        }

        let mainModule: DependencyContainer = DependencyContainer { container in
            container
                    .register {
                        MainViewController()
                    }
                    .implements(MainUIProtocol.self)
                    .resolvingProperties { (container, controller) in
                        controller.presenter = try container.resolve()
                    }

            container
                    .register {
                MainPresenter(pairSessionService: try container.resolve(), ui: try container.resolve()) as MainPresenterProtocol
            }
        }
        container.collaborate(with: startModule)
        container.collaborate(with: mainModule)

        DependencyContainer.uiContainers = [startModule, mainModule]
        try! container.bootstrap()

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateInitialViewController()

        self.window = UIWindow()
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()

        return true
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

    }


    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    }


    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }


    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
