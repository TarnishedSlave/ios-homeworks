//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Максим Шагдыров on 07.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }

    func createLogInViewController() -> UINavigationController {

        #if DEBUG

        let testUserService = TestUserService()
        let profileViewController = LogInViewController(userService: testUserService)
        profileViewController.title = "Профиль"
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
        return UINavigationController(rootViewController: profileViewController)

        #else

        let currentUserService = CurrentUserService()
        let profileViewController = LogInViewController(userService: currentUserService)
        profileViewController.title = "Профиль"
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
        return UINavigationController(rootViewController: profileViewController)

        #endif
    }
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let controllers = [createFeedViewController(),createLogInViewController()]
        tabBarController.viewControllers = controllers
        return tabBarController
    }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        window.rootViewController = createTabBarController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
