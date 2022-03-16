//
//  UIButton.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

class MyUIButton: UIView {
    
    private var myTextButton: UIButton!
    private var clickTimes: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
        setupImageButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 150, width: 300, height: 64)
        button.center.x = kScreenWidth / 2
        button.setBackgroundImage(UIImage(named: "testImage1"), for: .normal)
        button.setBackgroundImage(UIImage(named: "testImage2"), for: .selected)
        button.backgroundColor = .orange
        button.setTitle("这是一个可点击的按钮", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.setTitle("按钮已被点击成为选中状态", for: UIControl.State.selected)
        button.setTitleColor(UIColor.red, for: UIControl.State.selected)
        button.setTitle("按钮已成为不可用状态，点击下方图片按钮可恢复点击状态", for: UIControl.State.disabled)
        button.setTitleColor(UIColor.gray, for: UIControl.State.disabled)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.numberOfLines = 2
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(clickAction(sender:)), for: UIControl.Event.touchUpInside)
        self.addSubview(button)
        self.myTextButton = button
    }
    
    @objc func clickAction(sender: UIButton) {
        print("按钮被点击")
        if clickTimes == 6 {
            sender.isEnabled = false
            return
        }
        clickTimes += 1
        sender.isSelected = !sender.isSelected
    }
    
    private func setupImageButton() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 240, width: 100, height: 100)
        button.center.x = kScreenWidth / 2
        button.setImage(UIImage(named: "testImage1"), for: .normal)
        button.setImage(UIImage(named: "testImage2"), for: .selected)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(imageButtonClick(sender:)), for: .touchUpInside)
        self.addSubview(button)
    }
    
    @objc func imageButtonClick(sender: UIButton) {
        clickTimes = 0
        self.myTextButton.isEnabled = true
        self.myTextButton.isSelected = false
        sender.isSelected = !sender.isSelected
    }
}
