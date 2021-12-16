//
//  SceneDelegate.swift
//  SeSACWeek12
//
//  Created by 김재경 on 2021/12/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    /*
     Firebase Analytics, Crashlytics
     (옵션) XIB Custom Class (toss)
     (옵션) Navigation/TabBar Appearence
     
     레이아웃 코드 snapkit
     */

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print(#function)
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        //1. Storyboard: 컨트롤러 및 관련된 뷰를 정의할 때에는 뷰컨트롤러 클래스를 직접 초기화할 수 없기 때문에 instantiateViewController(withIdentifier:) 를 통해 프로그래밍 방식으로 인스턴스화됩니다.
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "vc") as! SnapDetailViewController
        
        //2. XIB
//        let bundle = Bundle(for: SettingViewController.self) //Swift Meta Type
//        let vc = SettingViewController(nibName: "SettingViewController", bundle: bundle)
        
        //3. Code
        let vc = SnapDetailViewController()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible() // iOS13
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print(#function)
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print(#function)
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print(#function)
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print(#function)
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print(#function)
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

