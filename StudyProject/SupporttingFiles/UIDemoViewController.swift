//
//  UIDemoViewController.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/6.
//

import Foundation
import UIKit

class UIDemoViewController: UIViewController {
    
    public var uiType: UIType?
    private var customTableView: MyCustomTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        self.title = self.uiType?.rawValue
        view.backgroundColor = .white
        
        if self.uiType == .UITableViewCustom {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 72, height: 32)
            button.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            button.setTitle("编辑", for: .normal)
            button.setTitle("取消", for: .selected)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.cornerRadius = 16
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(edit), for: .touchUpInside)
            let buttonItem = UIBarButtonItem(customView: button)
            self.navigationItem.rightBarButtonItem = buttonItem
        }
        
        setupDemoView()
    }
    
    private func setupDemoView() {
        if let type = uiType {
            switch type {
            case .UIView:
                let myView = MyUIView(frame: view.bounds)
                view.addSubview(myView)
            case .UILabel:
                let myView = MyUILabel(frame: view.bounds)
                view.addSubview(myView)
            case .UIImageView:
                let myView = MyUIImageView(frame: view.bounds)
                view.addSubview(myView)
            case .UIButton:
                let myView = MyUIButton(frame: view.bounds)
                view.addSubview(myView)
            case .UIScrollView:
                let myView = MyScrollView(frame: view.bounds)
                view.addSubview(myView)
            case .UITextField:
                let myView = MyTextField(frame: view.bounds)
                view.addSubview(myView)
            case .UITextView:
                let myView = MyTextView(frame: view.bounds)
                view.addSubview(myView)
            case .UITableView:
                let myView = MyTableView(frame: view.bounds)
                view.addSubview(myView)
            case .UITableViewCustom:
                let myView = MyCustomTableView(frame: view.bounds)
                view.addSubview(myView)
                self.customTableView = myView
            case .UICollectionView:
                let myView = MyCollectionView(frame: view.bounds)
                view.addSubview(myView)
            case .UICollectionViewCustom:
                let myView = UICollectionViewCustom(frame: view.bounds)
                view.addSubview(myView)
            }
        }
    }
    
    @objc func edit(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        customTableView?.edit(result: sender.isSelected)
    }
}
