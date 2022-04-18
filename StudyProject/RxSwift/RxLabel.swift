//
//  RxLabel.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/4/18.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RxLabel: UIView {
        
    private let disposeBag = DisposeBag()
    private var rxLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setObserval()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        rxLabel = label
    }
    
    private func setObserval() {
        let timer = Observable<Int>.interval(.milliseconds(100), scheduler: MainScheduler.instance)
        timer
        .map {
            String(format: "%02d:%02d:%d", ($0 / 600) % 600, ($0 % 600) / 10, $0 % 10)
        }
        .bind(to: rxLabel.rx.text)
        .disposed(by: disposeBag)
    }
}
