//
//  GradientAnimationView.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/12.
//

import UIKit

struct GradientColor {
    let start: UIColor
    let end: UIColor
}



class GradientAnimationView: UIView {

    // 定義漸層顏色的陣列
    private let gradientColors: [[CGColor]] = [
        [UIColor.white.cgColor, UIColor.gray.cgColor],
        [UIColor.gray.cgColor, UIColor.white.cgColor],

//        [UIColor.green.cgColor, UIColor.purple.cgColor],
//        [UIColor.purple.cgColor, UIColor.orange.cgColor]
    ]
    
    // 當前顏色索引
    private var currentIndex = 0
    
    // 設置漸層圖層
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
        startAnimating()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientLayer()
        startAnimating()
    }
    
    private func setupGradientLayer() {
        // 配置漸層圖層的初始屬性
        gradientLayer.frame = bounds
        gradientLayer.colors = gradientColors[currentIndex]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1) // 左邊中間
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)   // 右邊中間
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func startAnimating() {
        // 設置動畫
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.duration = 1.0
        colorChangeAnimation.toValue = nextGradientColors()
        colorChangeAnimation.fillMode = .backwards
        colorChangeAnimation.isRemovedOnCompletion = false
//        colorChangeAnimation.delegate = self
        
        colorChangeAnimation.repeatCount = Float.infinity
        colorChangeAnimation.autoreverses = true
        gradientLayer.add(colorChangeAnimation, forKey: "colorChange")
    }
    
    func stopAnimating() {
        gradientLayer.removeAllAnimations()
    }
    
    private func nextGradientColors() -> [CGColor] {
        // 計算下一組顏色
        currentIndex = (currentIndex + 1) % gradientColors.count
        return gradientColors[currentIndex]
    }

}

//extension GradientAnimationView: CAAnimationDelegate {
//    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        if flag {
//            // 更新漸層圖層的顏色
//            gradientLayer.colors = gradientColors[currentIndex]
//            // 繼續動畫
//            startAnimating()
//        }
//    }
//}
//
