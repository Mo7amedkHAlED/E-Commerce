//
//  SceneDelegate.swift
//  e-commerce
//
//  Created by Mohamed Khaled on 08/08/2022.
//

import UIKit
import MOLH
class SceneDelegate: UIResponder, UIWindowSceneDelegate,MOLHResetable {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        configureMOLH ()
        rootViewController()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func configureMOLH (){
        MOLHLanguage.setDefaultLanguage("EN")
        MOLH.shared.activate(true)
         
    }
    
    func reset() {
        //MARK: - to Know What page am I on?
        if let delegate = UIApplication.shared.connectedScenes.first?.delegate{
            UIView.transition(with:((delegate as? SceneDelegate)?.window)!, duration: 0.5, options: .transitionFlipFromLeft, animations: {}) { _ in // not return nothing
                self.rootViewController()
            }
        }
    }
    //MARK: - root View controller يعني الصفحه اللي هي المفروض تتفتح اول لم البرنامج يشتغل
    func rootViewController(){
        //MARK: - to get data from user default
        let userDefaultToken = UserDefaults.standard.string(forKey: "LoginToken")
        if userDefaultToken != nil{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        let navigationController = UINavigationController(rootViewController: loginViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            let navigationController = UINavigationController(rootViewController: loginViewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

