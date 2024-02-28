//
//  Sliders.swift
//  EmitterDemo
//
//  Created by Vikill Blacks on 2024/2/27.
//

import UIKit

class BirthRateSlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: BirthRateSliderDelegate?
    
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
        label.text = "BirthRate: \(slider.value)"
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
        // 这里可以添加代码来更新birthRate，但为了保持类职责单一，我们不在这里直接操作cell
        // 而是通过代理或者闭包将值传递给需要它的对象
        delegate?.birthRateSlider(self, didChangeValue: sender.value)
    }
}

protocol BirthRateSliderDelegate: AnyObject {
    func birthRateSlider(_ slider: BirthRateSlider, didChangeValue value: Float)
}

class EmitterZPositionSlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: EmitterZPositionSliderDelegate?
    
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
        label.text = "EmitterZPosition: \(slider.value)"
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
        delegate?.emitterZPositionSlider(self, didChangeValue: sender.value)
    }
}

protocol EmitterZPositionSliderDelegate: AnyObject {
    func emitterZPositionSlider(_ slider: EmitterZPositionSlider, didChangeValue value: Float)
}

class EmitterDepthSlider: UIView {
    var label: UILabel!
    private var slider: CustomSlider!
    weak var delegate: EmitterDepthSliderDelegate?
    
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
        label.text = "EmitterDepth: \(slider.value)"
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
        delegate?.emitterDepthSlider(self, didChangeValue: sender.value)
    }
}

protocol EmitterDepthSliderDelegate: AnyObject {
    func emitterDepthSlider(_ slider: EmitterDepthSlider, didChangeValue value: Float)
}

class RenderModeSelector: UIView {
    
    let renderModes = [CAEmitterLayerRenderMode.unordered, CAEmitterLayerRenderMode.oldestFirst, CAEmitterLayerRenderMode.oldestLast, CAEmitterLayerRenderMode.backToFront, CAEmitterLayerRenderMode.additive]
    
    var label: UILabel!
    private var segment: UISegmentedControl!
    weak var delegate: RenderModeSelectorDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSegment()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSegment()
    }
    
    private func setupSegment() {
        segment = UISegmentedControl(items: renderModes)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        label = UILabel()
        label.text = "RenderMode: \(segment.selectedSegmentIndex)"
        label.textColor = .label
        self.addSubview(segment)
        self.addSubview(label)
        self.setUpSegmentConstraints()
    }
    
    private func setUpSegmentConstraints() {
        segment.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(segment.snp.left)
            make.bottom.equalTo(segment.snp.top)
        }
    }
    
    @objc private func segmentValueChanged(_ sender: UISegmentedControl) {
        delegate?.renderModeSelector(self, didChangeValue: sender.selectedSegmentIndex)
    }
    
    func selectedRenderMode() -> CAEmitterLayerRenderMode {
        return renderModes[segment.selectedSegmentIndex]
    }
}

protocol RenderModeSelectorDelegate: AnyObject {
    func renderModeSelector(_ selector: RenderModeSelector, didChangeValue value: Int)
}

