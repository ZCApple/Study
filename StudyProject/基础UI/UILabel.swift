//
//  UILabel.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

class MyUILabel: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
        setupAttributeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        let label = UILabel(frame: CGRect(x: 50, y: 150, width: 300, height: 40))
        label.backgroundColor = UIColor.red
        label.text = "我的第一个UILabel，内容太多了，显示不完"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        //label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.textAlignment = NSTextAlignment.center
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.numberOfLines = 1
        self.addSubview(label)
    }
    
    private func setupAttributeLabel() {
        let label = UILabel(frame: CGRect(x: 50, y: 220, width: 300, height: 60))
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        let text = "床前明月光，疑是地上霜。\n举头望明月，低头思故乡。"
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.orange], range: NSRange(location: 0, length: 5))
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.purple], range: NSRange(location: 6, length: 5))
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor.blue], range: NSRange(location: 13, length: 5))
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.green], range: NSRange(location: 19, length: 5))
        label.attributedText = attributeString
        self.addSubview(label)
    }
}
