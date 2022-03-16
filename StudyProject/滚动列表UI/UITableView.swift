//
//  UITableView.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

class MyTableView: UIView {
        
    //数据源
    private var dataSource: [[String: Any]] = [
        ["header": "水果", "cells": ["西瓜", "桃子", "草莓", "樱桃", "菠萝", "芒果", "橘子", "苹果"], "footer": "西瓜是水果之王"],
        ["header": "蔬菜", "cells": ["白菜", "萝卜", "莴笋", "西兰花", "菠菜", "茄子", "黄瓜", "油麦菜"], "footer": "这些蔬菜都不好吃"],
        ["header": "动物", "cells": ["狮子🦁️", "老虎🐯", "大象🐘", "长颈鹿🦒", "鹿🦌", "猫🐱", "狗🐶", "马🐎"], "footer": "狮子🦁️是森林之王"]
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.frame.size.height = kScreenHeight - 88
        tableView.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        tableView.showsVerticalScrollIndicator = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset.bottom = 34
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.addSubview(tableView)
    }
}

extension MyTableView: UITableViewDelegate, UITableViewDataSource {
    /* UITableViewDataSource 数据源方法 */
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cells = (dataSource[section]["cells"] as? [String]) ?? []
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let cells = (dataSource[indexPath.section]["cells"] as? [String]) ?? [String]()
        cell.textLabel?.text = cells[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (dataSource[section]["header"] as? String) ?? ""
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return (dataSource[section]["footer"] as? String) ?? ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    /* UITableViewDelegate 代理方法 */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cells = (dataSource[indexPath.section]["cells"] as? [String]) ?? [String]()
        let text = cells[indexPath.row]
        print("点击了: \(text)")
    }
}
