//
//  UIScrollView.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit

class MyScrollView: UIView {
    
    private var myScrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupChildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 88))
        scrollView.backgroundColor = UIColor.green.withAlphaComponent(0.4)
        scrollView.isScrollEnabled = true
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.contentSize = CGSize(width: kScreenWidth, height: 1000)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 34, right: 0)
        scrollView.delegate = self
        self.addSubview(scrollView)
        myScrollView = scrollView
    }
    
    private func setupChildView() {
        let image = UIImage(named: "smallImage")?.resizableImage(withCapInsets: .zero, resizingMode: .tile)
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 100, width: 300, height: 300)
        imageView.center.x = kScreenWidth / 2
        imageView.image = image
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.masksToBounds = true
        myScrollView.addSubview(imageView)
        
        let image1 = UIImage(named: "testImage1")
        let imageView1 = UIImageView()
        imageView1.frame = CGRect(x: 0, y: imageView.frame.maxY + 32, width: 300, height: 300)
        imageView1.center.x = kScreenWidth / 2
        imageView1.image = image1
        imageView1.contentMode = UIView.ContentMode.scaleAspectFill
        imageView1.layer.masksToBounds = true
        myScrollView.addSubview(imageView1)
        
        let image2 = UIImage(named: "testImage2")
        let imageView2 = UIImageView()
        imageView2.frame = CGRect(x: 0, y: imageView1.frame.maxY + 32, width: 300, height: 300)
        imageView2.center.x = kScreenWidth / 2
        imageView2.image = image2
        imageView2.contentMode = UIView.ContentMode.scaleAspectFill
        imageView2.layer.masksToBounds = true
        myScrollView.addSubview(imageView2)
        
        let label = UILabel(frame: CGRect(x: 0, y: imageView2.frame.maxY + 32, width: 300, height: 60))
        label.center.x = kScreenWidth / 2
        label.backgroundColor = UIColor.red
        label.text = "我的第一个UILabel，内容太多了，显示不完"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = NSTextAlignment.center
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.numberOfLines = 2
        myScrollView.addSubview(label)
        
        let attriLabel = UILabel(frame: CGRect(x: 0, y: label.frame.maxY + 32, width: 300, height: 100))
        attriLabel.center.x = kScreenWidth / 2
        attriLabel.backgroundColor = UIColor.red
        attriLabel.textColor = UIColor.black
        attriLabel.font = UIFont.systemFont(ofSize: 16)
        attriLabel.textAlignment = .center
        attriLabel.numberOfLines = 2
        let text = "床前明月光，疑是地上霜。\n举头望明月，低头思故乡。"
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.orange], range: NSRange(location: 0, length: 5))
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.purple], range: NSRange(location: 6, length: 5))
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor.blue], range: NSRange(location: 13, length: 5))
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.green], range: NSRange(location: 19, length: 5))
        attriLabel.attributedText = attributeString
        myScrollView.addSubview(attriLabel)
        
        let scrollHeight = attriLabel.frame.maxY
        myScrollView.contentSize = CGSize(width: kScreenWidth, height: scrollHeight)
    }
}

extension MyScrollView: UIScrollViewDelegate {
    /*
     UIScrollViewDelegate
     学习重点：了解UIScrolView的滑动事件生命周期，即从开始滑动到滑动停止
     注意区分scrollViewDidEndDecelerating和scrollViewDidEndScrollingAnimation的触发时机
     */
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        print("x = \(contentOffset.x), y = \(contentOffset.y)")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
    }
}

