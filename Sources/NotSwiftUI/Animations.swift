//
//  Animations.swift
//  
//
//  Created by Jonas Gamburg on 16/04/2022.
//

import UIKit

extension UIView {
    @discardableResult public func actionWithSpringAnimation(_ action: @escaping () -> Void) -> UIView {
        UIView.animate(withDuration: 0.15, delay: 0, options: .allowUserInteraction) {
            self.transform = .init(scaleX: 0.94, y: 0.94)
            self.alpha     = 0.5
        } completion: { _ in
            UIView.animate(withDuration: 0.15, delay: 0, options: .allowUserInteraction) {
                self.transform = .identity
                self.alpha     = 1
            } completion: {  _ in
                action()
            }
        }
        
        return self
    }
    
    @discardableResult public func shake() -> UIView {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
        
        return self
    }
}
