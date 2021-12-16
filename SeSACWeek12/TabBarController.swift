//
//  TabBarController.swift
//  SeSACWeek12
//
//  Created by 김재경 on 2021/12/15.
//

import UIKit
//NavigationController, TabBarController
//TabBar, TabBarItem(title, image, selectImage), tintColor
//iOS13: UITabBarAppearence (버전에 따른 분기 처리 필요)

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarController()
        setupTabBarAppearence()
    }
    
    func configureTabBarController() {
        let firtVC = SettingViewController(nibName: "SettingViewController", bundle: nil)
        firtVC.tabBarItem.title = "설정 화면"
        firtVC.tabBarItem.image = UIImage(systemName: "star")
        firtVC.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        
        let secondVC = SnapDetailViewController()
        secondVC.tabBarItem = UITabBarItem(title: "스냅킷", image: UIImage(systemName: "trash"), selectedImage: UIImage(systemName: "trash.fill"))
         
        let thirdVC = DetailViewController()
        thirdVC.title = "디테일"
        let thirdNav = UINavigationController(rootViewController: thirdVC)
        
        setViewControllers([firtVC, secondVC, thirdNav], animated: true)
    }
    
    func setupTabBarAppearence() {
        let appearence = UITabBarAppearance()
        appearence.configureWithTransparentBackground()
        appearence.backgroundColor = .red
        tabBar.standardAppearance = appearence
        tabBar.scrollEdgeAppearance = appearence
        tabBar.tintColor = .black
    }
}

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }
}
