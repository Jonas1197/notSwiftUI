//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit


//MARK: - Objectified methods
extension UIView: Objectified {
    public func shadowed(with color: UIColor, _ offset: CGSize, radius: CGFloat, _ opacity: Float) -> UIView {
        (self as UIView).layer.shadowColor   = color.cgColor
        (self as UIView).layer.shadowOffset  = offset
        (self as UIView).layer.shadowRadius  = radius
        (self as UIView).layer.shadowOpacity = opacity
        return self
    }
    
    public func translucent(_ opacity: Float = 0.6) -> UIView {
        layer.opacity = opacity
        return self
    }
    
    public func invisible() -> UIView {
        layer.opacity = 0
        return self
    }
    
    public func hidden() -> UIView {
        isHidden = true
        return self
    }
    
    public func showing() -> UIView {
        isHidden = false
        return self
    }
    
    public func backgroundColored(_ color: UIColor) -> UIView {
        backgroundColor = color
        return self
    }
    
    public func tintColored(_ color: UIColor) -> UIView {
        tintColor = color
        return self
    }
    
    public func rounded(_ radius: CGFloat) -> UIView {
        layer.cornerRadius = radius
        layer.layoutIfNeeded()
        return self
    }
    
    public func addTarget(_ target: Any, action: Selector) {
        if self is UIButton {
            (self as! UIButton).addTarget(target, action: action, for: .touchUpInside)
        } else {
            addTarget(target, action: action)
        }
    }
}


//MARK: - Fixing views
extension UIView {
    public func center(in view: UIView) -> UIView {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return self
    }
    
    public func fill(in view: UIView,
                     leadingPadding:  CGFloat = 0,
                     trailingPadding: CGFloat = 0,
                     topPadding:      CGFloat = 0,
                     bottomPadding:   CGFloat = 0) -> UIView {
        
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo:  view.leadingAnchor,  constant: leadingPadding),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingPadding),
            self.topAnchor.constraint(equalTo:      view.topAnchor,      constant: topPadding),
            self.bottomAnchor.constraint(equalTo:   view.bottomAnchor,   constant: bottomPadding)
        ])
        
        return self
    }
}
