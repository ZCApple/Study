//
//  UIView.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

let kScreenWidth = UIScreen.main.bounds.width   //屏幕的宽
let kScreenHeight = UIScreen.main.bounds.height //屏幕的高

class MyUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let myView = UIView(frame: CGRect(x: 0, y: 150, width: 150, height: 150))
        myView.center.x = kScreenWidth / 2
        myView.backgroundColor = UIColor.red
        myView.layer.cornerRadius = 12
        myView.layer.borderColor = UIColor.black.cgColor
        myView.layer.borderWidth = 2
        myView.layer.shadowColor = UIColor.green.withAlphaComponent(0.5).cgColor
        myView.layer.shadowOffset = CGSize(width: 0, height: 6)
        myView.layer.shadowRadius = 10
        myView.layer.shadowOpacity = 1.0
        myView.layer.masksToBounds = false
        myView.clipsToBounds = true
        myView.isUserInteractionEnabled = true
        self.addSubview(myView)
    }
}
