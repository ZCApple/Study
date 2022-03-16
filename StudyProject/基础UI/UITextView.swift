//
//  UITextView.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

class MyTextView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let textView = UITextView(frame: CGRect(x: 0, y: 150, width: 300, height: 300))
        textView.center.x = kScreenWidth / 2
        textView.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 12
        textView.layer.masksToBounds = true
        textView.textColor = UIColor.blue.withAlphaComponent(0.5)
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textAlignment = .left
        textView.keyboardType = .numbersAndPunctuation
        textView.returnKeyType = .done
        textView.showsVerticalScrollIndicator = true
        textView.delegate = self
        self.addSubview(textView)
    }
}

extension MyTextView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}
