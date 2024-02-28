//
//  ControllerScrollView.swift
//  EmitterDemo
//
//  Created by Vikill Blacks on 2024/2/28.
//

import UIKit

class ControllerScrollView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUpScrollView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsVerticalScrollIndicator = true
        self.bounces = true
    }
}
