//
//  UIImageView.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

class MyUIImageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        /*
         UIImage: 图片类，加载图片
         */
        let image = UIImage(named: "testImage2")
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 200, width: 300, height: 300)
        imageView.center.x = kScreenWidth / 2
        imageView.image = image
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.masksToBounds = true
        self.addSubview(imageView)
    }
}
