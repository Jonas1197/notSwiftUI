//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit


//MARK: - Objectified methods
extension UIView: Objectified {
    public func shadowed(with color: UIColor, offset: CGSize, radius: CGFloat, _ opacity: Float) -> UIView {
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
    
    public func bordered(width: CGFloat, color: UIColor) -> UIView {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    
    public func setSymbol(symbolName: String, pointSize: CGFloat, contentMode: UIImageView.ContentMode, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale, tintColor: UIColor) -> UIView {
        if let _ = self as? UIImageView {
            let configuration                  = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
            let image                          = UIImage(systemName: symbolName, withConfiguration: configuration)
            (self as! UIImageView).image       = image
            (self as! UIImageView).tintColor   = tintColor
            (self as! UIImageView).contentMode = contentMode
        }
        
        return self
    }
    
    public func setImage(imageName: String) -> UIView {
        if let _ = self as? UIImageView {
            (self as! UIImageView).image = .init(named: imageName)
            
        } else if let _ = self as? UIButton {
            (self as! UIButton).setImage(.init(named: imageName), for: .normal)
        }
        
        return self
    }
    
    public func setSystemFont(with size: CGFloat) -> UIView {
        if let label = self as? UILabel {
            label.font = .systemFont(ofSize: size)
            
        } else if let textView = self as? UITextView {
            textView.font = .systemFont(ofSize: size)
            
        } else if let textField = self as? UITextField {
            textField.font = .systemFont(ofSize: size)
        }
        
        return self
    }
    
    public func setText(_ text: String) -> UIView {
        if let label = self as? UILabel {
            label.text = text
            
        } else if let textView = self as? UITextView {
            textView.text = text
            
        } else if let textField = self as? UITextField {
            textField.text = text
        }
        
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
    public func centered(in view: UIView) -> UIView {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return self
    }
    
    public func filled(in view: UIView,
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
    
    public func filled(in view: UIView, bellow topView: UIView, withPadding padding: CGFloat = 0) -> UIView {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: padding),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return self
    }
    
 }


extension Array where Element == UIView {
    public func vstacked(spacing: CGFloat, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution) -> UIView {
        return Object.vstack(arrangedSubviews: self, spacing: spacing, alignment: alignment, distribution: distribution).create()
    }
    
    public func hstacked(spacing: CGFloat, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution) -> UIView {
        return Object.hstack(arrangedSubviews: self, spacing: spacing, alignment: alignment, distribution: distribution).create()
    }
}
