//
//  UITextField.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

class MyTextField: UIView {
    
    private var myTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let textField = UITextField(frame: CGRect(x: 0, y: 200, width: 300, height: 44))
        textField.center.x = kScreenWidth / 2
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        textField.textColor = UIColor.blue.withAlphaComponent(0.5)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        textField.textAlignment = .center
        textField.placeholder = "请输入你的内容"
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
        textField.delegate = self
        //textField.isSecureTextEntry = true
        self.addSubview(textField)
        self.myTextField = textField
    }
    
    private func setupButton() {
        let button1 = UIButton(type: .custom)
        button1.frame = CGRect(x: myTextField.frame.minX, y: myTextField.frame.maxY + 20, width: 140, height: 40)
        button1.backgroundColor = .orange
        button1.setTitle("开始输入", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button1.layer.cornerRadius = 8
        button1.layer.masksToBounds = true
        button1.addTarget(self, action: #selector(beginEdit), for: .touchUpInside)
        self.addSubview(button1)
        
        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: button1.frame.maxX + 20, y: myTextField.frame.maxY + 20, width: 140, height: 40)
        button2.backgroundColor = .orange
        button2.setTitle("结束输入", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button2.layer.cornerRadius = 8
        button2.layer.masksToBounds = true
        button2.addTarget(self, action: #selector(endEdit), for: .touchUpInside)
        self.addSubview(button2)
    }
    
    @objc func textChanged(textField: UITextField) {
        print("当前的输入内容：\(textField.text ?? "")")
    }
    
    @objc func beginEdit() {
        myTextField.becomeFirstResponder()
    }
    
    @objc func endEdit() {
        myTextField.resignFirstResponder()
    }
}

extension MyTextField: UITextFieldDelegate {
    /* 代理方法 */
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
