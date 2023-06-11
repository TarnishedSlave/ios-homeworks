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
        let userService = UserServiceImpl() // Create an instance of UserServiceImpl
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

// Remaining SceneDelegate methods...

class UserServiceImpl: UserService {
    init() {
        // Perform any necessary initialization here
    }

    func getUser(withLogin login: String) -> User? {
        // Implement the logic to fetch a user based on the login
        // Return the user if found, or nil if not found
        // Example implementation:

        // Assuming you have an array of users called "users"
        let user = users.first { $0.login == login }
        return user
    }
}

// Create a placeholder array of users for testing purposes
let users: [User] = [
    User(login: "john", fullName: "John Doe", avatar: UIImage(named: "john_avatar"), status: "Active"),
    User(login: "jane", fullName: "Jane Smith", avatar: UIImage(named: "jane_avatar"), status: "Inactive")
]

