//
//  DemoNavigationController.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/6.
//

import Foundation
import UIKit

class DemoNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    private func setupAppearance() {
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = .white
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return children.count != 1
    }
}
