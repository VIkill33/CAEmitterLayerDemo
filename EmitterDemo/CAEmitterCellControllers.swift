//
//  CAEmitterCellControllers.swift
//  EmitterDemo
//
//  Created by Vikill Blacks on 2024/2/28.
//

import UIKit

class LifetimeSlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: LifetimeSliderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSlider()
    }
    
    private func setupSlider() {
        slider = CustomSlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 6 // 默认值
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        label = UILabel()
        label.text = "Lifetime: \(slider.value)"
        label.textColor = .label
        self.addSubview(slider)
        self.addSubview(label)
        self.setUpSliderConstraints()
    }
    
    private func setUpSliderConstraints() {
        slider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(10)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(slider.snp.left)
            make.bottom.equalTo(slider.snp.top)
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        delegate?.lifetimeSlider(self, didChangeValue: sender.value)
    }
}

protocol LifetimeSliderDelegate: AnyObject {
    func lifetimeSlider(_ slider: LifetimeSlider, didChangeValue value: Float)
}

class VelocitySlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: VelocitySliderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSlider()
    }
    
    private func setupSlider() {
        slider = CustomSlider()
        slider.minimumValue = 0
        slider.maximumValue = 1000
        slider.value = 300 // 默认值
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        label = UILabel()
        label.text = "Velocity: \(slider.value)"
        label.textColor = .label
        self.addSubview(slider)
        self.addSubview(label)
        self.setUpSliderConstraints()
    }
    
    private func setUpSliderConstraints() {
        slider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(10)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(slider.snp.left)
            make.bottom.equalTo(slider.snp.top)
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        delegate?.velocitySlider(self, didChangeValue: sender.value)
    }
}

protocol VelocitySliderDelegate: AnyObject {
    func velocitySlider(_ slider: VelocitySlider, didChangeValue value: Float)
}

class YAccelerationSlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: YAccelerationSliderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSlider()
    }
    
    private func setupSlider() {
        slider = CustomSlider()
        slider.minimumValue = -1000
        slider.maximumValue = 1000
        slider.value = 300 // 默认值
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        label = UILabel()
        label.text = "YAcceleration: \(slider.value)"
        label.textColor = .label
        self.addSubview(slider)
        self.addSubview(label)
        self.setUpSliderConstraints()
    }
    
    private func setUpSliderConstraints() {
        slider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(10)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(slider.snp.left)
            make.bottom.equalTo(slider.snp.top)
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        delegate?.yAccelerationSlider(self, didChangeValue: sender.value)
    }
}

protocol YAccelerationSliderDelegate: AnyObject {
    func yAccelerationSlider(_ slider: YAccelerationSlider, didChangeValue value: Float)
}

class CellSpinSlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: CellSpinSliderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSlider()
    }
    
    private func setupSlider() {
        slider = CustomSlider()
        slider.minimumValue = -10
        slider.maximumValue = 10
        slider.value = 0 // 默认值
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        label = UILabel()
        label.text = "CellSpin: \(slider.value)"
        label.textColor = .label
        self.addSubview(slider)
        self.addSubview(label)
        self.setUpSliderConstraints()
    }
    
    private func setUpSliderConstraints() {
        slider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(10)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(slider.snp.left)
            make.bottom.equalTo(slider.snp.top)
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        delegate?.cellSpinSlider(self, didChangeValue: sender.value)
    }
}

protocol CellSpinSliderDelegate: AnyObject {
    func cellSpinSlider(_ slider: CellSpinSlider, didChangeValue value: Float)
}

class CellSpinRangeSlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: CellSpinRangeSliderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSlider()
    }
    
    private func setupSlider() {
        slider = CustomSlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 0 // 默认值
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        label = UILabel()
        label.text = "CellSpinRange: \(slider.value)"
        label.textColor = .label
        self.addSubview(slider)
        self.addSubview(label)
        self.setUpSliderConstraints()
    }
    
    private func setUpSliderConstraints() {
        slider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(10)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(slider.snp.left)
            make.bottom.equalTo(slider.snp.top)
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        delegate?.cellSpinRangeSlider(self, didChangeValue: sender.value)
    }
}

protocol CellSpinRangeSliderDelegate: AnyObject {
    func cellSpinRangeSlider(_ slider: CellSpinRangeSlider, didChangeValue value: Float)
}
