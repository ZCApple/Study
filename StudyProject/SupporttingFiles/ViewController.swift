//
//  ViewController.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import UIKit

enum UIType: String, CaseIterable {
    case UIView
    case UILabel
    case UIImageView
    case UIButton
    case UIScrollView
    case UITextField
    case UITextView
    case UITableView
    case UITableViewCustom
    case UICollectionView
    case UICollectionViewCustom
}

class ViewController: UIViewController {
        
    private var dataSource: [UIType] = [
        .UIView,
        .UILabel,
        .UIImageView,
        .UIButton,
        .UIScrollView,
        .UITextField,
        .UITextView,
        .UITableView,
        .UITableViewCustom,
        .UICollectionView,
        .UICollectionViewCustom
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UI控件学习代码"
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func setupUI() {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 64
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].rawValue
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIDemoViewController()
        vc.uiType = dataSource[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

