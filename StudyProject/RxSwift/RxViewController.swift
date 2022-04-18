//
//  RxViewController.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/4/18.
//

import Foundation
import UIKit

class RxViewController: UIViewController {
    
    public var rxType: RxDemoType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        switch rxType {
        case .label:
            let label = RxLabel()
            view.addSubview(label)
            label.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        case .none:
            break
        }
    }
}
