//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Максим Шагдыров on 07.03.2023.
//

import UIKit
import StorageService


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

        var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController =  createTabBarController()
        let loginViewController = ProfileViewController(userService: CurrentUserService())

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = loginViewController
        self.window = window
        window.makeKeyAndVisible()
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
            let logInViewController = LogInViewController(userService: TestUserService(testUser: User(login: "String", fullName: "String", avatar: UIImage(named: "cat") ?? UIImage(), status: "String")))
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
            UITabBar.appearance().backgroundColor = .systemGray2
            return tabBarController
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
