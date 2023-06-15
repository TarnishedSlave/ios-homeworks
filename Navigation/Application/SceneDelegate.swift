//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Максим Шагдыров on 07.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }

    func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Feed"
        feedViewController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        return UINavigationController(rootViewController: feedViewController)
    }

    func createProfileViewController() -> UINavigationController {
        
        let user = User(login: "max", fullName: "Max", avatar: UIImage(named: "magic")!, status: "active")
        let userService = CurrentUserService(currentUser: user)
        
        let logInViewController = LogInViewController(userService: userService)
        logInViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.fill"),
            tag: 1
        )
        return UINavigationController(rootViewController: logInViewController)
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [createFeedViewController(), createProfileViewController()]
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return tabBarController
    }
}
