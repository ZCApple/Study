//
//  RxDemoViewController.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/4/18.
//

import Foundation
import UIKit

enum RxDemoType {
    case label
    
    var title: String {
        switch self {
        case .label:
            return "RxLabel"
        }
    }
}

class RxDemoViewController: UITableViewController {
    
    private let dataSource: [RxDemoType] = [.label]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        title = "RxCocoa"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorColor = .black.withAlphaComponent(0.2)
        tableView.rowHeight = 54
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

extension RxDemoViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].title
        cell.textLabel?.textColor = .black.withAlphaComponent(0.85)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataSource[indexPath.row]
        let vc = RxViewController()
        vc.rxType = type
        navigationController?.pushViewController(vc, animated: true)
    }
}
