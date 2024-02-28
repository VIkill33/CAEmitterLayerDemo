//
//  TestVC.swift
//  EmitterDemo
//
//  Created by Vikill Blacks on 2024/2/28.
//

import UIKit

class TestViewController: UIViewController {
    private var controllerScrollView: UIScrollView!
//    private var scrollViewContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controllerScrollView = UIScrollView()
        view.addSubview(controllerScrollView)
//        controllerScrollView.addSubview(scrollViewContainer)

        controllerScrollView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(200)
        }
        // 创建并添加6个UILabel
        var labels: [UILabel] = []
        // 创建并添加6个UILabel
        for i in 0..<6 {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Label \(i)"
            label.textAlignment = .center
            label.backgroundColor = .lightGray
            controllerScrollView.addSubview(label)
            labels.append(label)
            if i == 0 {
                // 对于第一个label，设置顶部约束
                label.snp.makeConstraints { make in
                    make.top.equalTo(controllerScrollView).offset(20)
                    make.width.equalTo(controllerScrollView)
                    make.height.equalTo(100)
                }
            } else {
                // 对于其他label，设置顶部约束为前一个label的底部
                label.snp.makeConstraints { make in
                    make.top.equalTo(labels[i - 1].snp.bottom).offset(20)
                    make.width.equalTo(controllerScrollView)
                    make.height.equalTo(100)
                }
            }
        }
        let totalHeight = CGFloat(labels.count * 120)
        controllerScrollView.contentSize = CGSize(width: 0, height: totalHeight)
//        scrollViewContainer.backgroundColor = .systemPink
//        scrollViewContainer.snp.makeConstraints { make in
//            make.left.right.top.bottom.width.equalTo(controllerScrollView)
//            make.height.equalTo(totalHeight)
//        }
    }
}
