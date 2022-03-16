//
//  DemoTabbarController.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/6.
//

import Foundation
import UIKit

class DemoTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAppearance()
        creatChildViewControllers()
    }
    
    private func initAppearance() {
        tabBar.backgroundColor = .white
    }
    
    private func creatChildViewControllers() {
        let vc1 = ViewController()
        vc1.title = "One"
        vc1.tabBarItem.image = UIImage(named: "healersTabGrey")
        vc1.tabBarItem.selectedImage = UIImage(named: "healersTab")
        vc1.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 12)], for: .normal)
        vc1.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.blue, .font: UIFont.systemFont(ofSize: 12)], for: .selected)
        let navi1 = DemoNavigationController(rootViewController: vc1)
        
        let vc2 = ViewController()
        vc2.title = "Two"
        vc2.tabBarItem.image = UIImage(named: "readingsTabGrey")
        vc2.tabBarItem.selectedImage = UIImage(named: "readingsTab")
        vc2.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 12)], for: .normal)
        vc2.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.blue, .font: UIFont.systemFont(ofSize: 12)], for: .selected)
        let navi2 = DemoNavigationController(rootViewController: vc2)
        
        let vc3 = ViewController()
        vc3.title = "Three"
        vc3.tabBarItem.image = UIImage(named: "accountTabGrey")
        vc3.tabBarItem.selectedImage = UIImage(named: "accountTab")
        vc3.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 12)], for: .normal)
        vc3.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.blue, .font: UIFont.systemFont(ofSize: 12)], for: .selected)
        let navi3 = DemoNavigationController(rootViewController: vc3)
        viewControllers = [navi1, navi2, navi3]
    }
}
