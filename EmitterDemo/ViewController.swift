//
//  ViewController.swift
//  EmitterDemo
//
//  Created by Vikill Blacks on 2024/2/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController, BirthRateSliderDelegate, RenderModeSelectorDelegate, LifetimeSliderDelegate, VelocitySliderDelegate, YAccelerationSliderDelegate, CellSpinSliderDelegate, CellSpinRangeSliderDelegate {
    
    private var controllerScrollView: ControllerScrollView!
    private var controllerScrollContainer = UIView()
    private var birthRateSlider: BirthRateSlider!
    private var renderModeSelector: RenderModeSelector!
    private var lifetimeSlider: LifetimeSlider!
    private var velocitySlider: VelocitySlider!
    private var yAccerlerationSlider: YAccelerationSlider!
    private var cellSpinSlider: CellSpinSlider!
    private var cellSpinRangeSlider: CellSpinRangeSlider!
    
    private var cell = CAEmitterCell()
    private var particleEmitter = CAEmitterLayer()
    
    lazy private var sampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello World!"
        label.textColor = UIColor.white
        return label
    }()
    
    private var emitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        backgroundView.backgroundColor = .systemBackground
        self.view.addSubview(backgroundView)
        controllerScrollView = ControllerScrollView()
        birthRateSlider = BirthRateSlider()
        birthRateSlider.delegate = self
        renderModeSelector = RenderModeSelector()
        renderModeSelector.delegate = self
        lifetimeSlider = LifetimeSlider()
        lifetimeSlider.delegate = self
        velocitySlider = VelocitySlider()
        velocitySlider.delegate = self
        yAccerlerationSlider = YAccelerationSlider()
        yAccerlerationSlider.delegate = self
        cellSpinSlider = CellSpinSlider()
        cellSpinSlider.delegate = self
        cellSpinRangeSlider = CellSpinRangeSlider()
        cellSpinRangeSlider.delegate = self
        view.backgroundColor = UIColor.black
        view.addSubview(sampleLabel)
        view.addSubview(emitButton)
        view.addSubview(controllerScrollView)
        controllerScrollView.addSubview(controllerScrollContainer)
        controllerScrollContainer.addSubview(birthRateSlider)
        controllerScrollContainer.addSubview(renderModeSelector)
        controllerScrollContainer.addSubview(lifetimeSlider)
        controllerScrollContainer.addSubview(velocitySlider)
        controllerScrollContainer.addSubview(yAccerlerationSlider)
        controllerScrollContainer.addSubview(cellSpinSlider)
        controllerScrollContainer.addSubview(cellSpinRangeSlider)
        setUpEmitButton()
        setUpConstraints()
    }
    
    func setUpConstraints() {
        emitButton.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        controllerScrollView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(emitButton.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
        }
        controllerScrollContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        birthRateSlider.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(controllerScrollContainer.snp.top).offset(20)
        }
        renderModeSelector.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(birthRateSlider.snp.bottom).offset(20)
        }
        lifetimeSlider.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(renderModeSelector.snp.bottom).offset(20)
        }
        velocitySlider.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(lifetimeSlider.snp.bottom).offset(20)
        }
        yAccerlerationSlider.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(velocitySlider.snp.bottom).offset(20)
        }
        cellSpinSlider.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(yAccerlerationSlider.snp.bottom).offset(20)
        }
        cellSpinRangeSlider.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(cellSpinSlider.snp.bottom).offset(20)
            make.bottom.equalTo(controllerScrollContainer)
        }
    }
    
    func setUpEmitButton() {
        emitButton.translatesAutoresizingMaskIntoConstraints = false
        emitButton.setTitle("Start", for: .normal)
        emitButton.backgroundColor = .systemBlue
        emitButton.layer.cornerRadius = 8.0
        emitButton.layer.cornerCurve = .continuous
        emitButton.tintColor = .white
        emitButton.contentEdgeInsets = UIEdgeInsets(
            top: 5,
            left: 10,
            bottom: 5,
            right: 10
        )
        emitButton.addTarget(self, action: #selector(createParticles), for: .touchUpInside)
    }
    
    @objc func createParticles(sender: UIButton!) {
        
        particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: view.frame.height / 2.0)
        particleEmitter.emitterShape = .point
        particleEmitter.emitterSize = CGSize(width: 20, height: 20)
        particleEmitter.renderMode = .additive
        
        
        cell.birthRate = 8
        cell.lifetime = 10.0
        cell.velocity = 300
        cell.velocityRange = 50
        cell.yAcceleration = 300
        cell.zAcceleration = 100.0
        cell.emissionLongitude = .pi
        cell.spinRange = 5
        cell.scale = 0.5
        cell.scaleRange = 0.25
        cell.color = UIColor.label.cgColor.copy(alpha: 0.1)
        cell.emissionRange = .pi
        cell.emissionLongitude = .pi/(-2)
        cell.alphaSpeed = -0.025
        cell.contents = UIImage(named: "particle")?.cgImage
        particleEmitter.emitterCells = [cell]
        
        self.view.layer.addSublayer(particleEmitter)
    }
    
    func birthRateSlider(_ slider: BirthRateSlider, didChangeValue value: Float) {
        slider.label.text = "BirthRate: \(value)"
        updateParticleEmitter(for: view) { particleEmitter in
            particleEmitter.birthRate = value
        }
    }
    
    func renderModeSelector(_ selector: RenderModeSelector, didChangeValue value: Int) {
        selector.label.text = "RenderMode: \(value)"
        updateParticleEmitter(for: view) { particleEmitter in
            particleEmitter.renderMode = selector.selectedRenderMode()
        }
    }
    
    func lifetimeSlider(_ slider: LifetimeSlider, didChangeValue value: Float) {
        slider.label.text = "Lifetime: \(value)"
        updateParticleEmitterCell(for: view) { cell in
            cell.lifetime = value
        }
    }
    
    func velocitySlider(_ slider: VelocitySlider, didChangeValue value: Float) {
        slider.label.text = "Velocity: \(value)"
        updateParticleEmitterCell(for: view) { cell in
            cell.velocity = CGFloat(value)
        }
    }
    
    func yAccelerationSlider(_ slider: YAccelerationSlider, didChangeValue value: Float) {
        slider.label.text = "YAcceleration: \(value)"
        updateParticleEmitterCell(for: view) { cell in
            cell.yAcceleration = CGFloat(value)
        }
    }
    
    func updateParticleEmitter(for view: UIView, with action: (CAEmitterLayer) -> Void) {
        if let sublayers = view.layer.sublayers {
            for sublayer in sublayers {
                if let particleEmitter = sublayer as? CAEmitterLayer {
                    action(particleEmitter)
                    return
                }
            }
        }
    }
    
    func updateParticleEmitterCell(for view: UIView, with action: (CAEmitterCell) -> Void) {
        if let sublayers = view.layer.sublayers {
            for sublayer in sublayers {
                if let particleEmitter = sublayer as? CAEmitterLayer {
                    particleEmitter.emitterCells = nil
                    action(cell)
                    particleEmitter.emitterCells = [cell]
                    return
                }
            }
        }
    }
    
    func cellSpinSlider(_ slider: CellSpinSlider, didChangeValue value: Float) {
        slider.label.text = "CellSpin: \(value)"
        updateParticleEmitterCell(for: view) { cell in
            cell.spin = CGFloat(value)
        }
        
    }
    
    func cellSpinRangeSlider(_ slider: CellSpinRangeSlider, didChangeValue value: Float) {
        slider.label.text = "CellSpinRange: \(value)"
        updateParticleEmitterCell(for: view) { cell in
            cell.spinRange = CGFloat(value)
        }
    }
}
