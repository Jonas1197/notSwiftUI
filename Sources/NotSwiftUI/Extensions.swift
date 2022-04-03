//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit

/*
 withDuration duration: TimeInterval,
                     andDelay delay: TimeInterval,
                     withOptions options: UIView.AnimationOptions,
                     _ completion: @escaping AnimationComplition,
                     _ endAnimationComplition: FinishedAnimationComplition?
 */

public enum ChainedAction {
    case animation(duration: TimeInterval,
                   delay: TimeInterval = 0,
                   options: UIView.AnimationOptions = [.allowUserInteraction, .curveEaseOut],
                   completion: AnimationComplition,
                   endAnimationComplition: FinishedAnimationComplition? = nil)
}


//MARK: - Objectified methods
extension UIView: Objectified {
    @discardableResult public func shadowed(with color: UIColor, offset: CGSize, radius: CGFloat, _ opacity: Float) -> UIView {
        (self as UIView).layer.shadowColor   = color.cgColor
        (self as UIView).layer.shadowOffset  = offset
        (self as UIView).layer.shadowRadius  = radius
        (self as UIView).layer.shadowOpacity = opacity
        return self
    }
    
    @discardableResult public func translucent(_ opacity: Float = 0.6) -> UIView {
        layer.opacity = opacity
        return self
    }
    
    @discardableResult public func invisible() -> UIView {
        layer.opacity = 0
        return self
    }
    
    @discardableResult public func visible() -> UIView {
        layer.opacity = 1
        return self
    }
    
    @discardableResult public func hidden() -> UIView {
        isHidden = true
        return self
    }
    
    @discardableResult public func showing() -> UIView {
        isHidden = false
        return self
    }
    
    @discardableResult public func backgroundColored(_ color: UIColor) -> UIView {
        backgroundColor = color
        return self
    }
    
    @discardableResult public func tintColored(_ color: UIColor) -> UIView {
        tintColor = color
        return self
    }
    
    @discardableResult public func rounded(_ radius: CGFloat) -> UIView {
        layer.cornerRadius = radius
        layer.layoutIfNeeded()
        return self
    }
    
    @discardableResult public func bordered(width: CGFloat, color: UIColor) -> UIView {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    
    @discardableResult public func setLinebreakMode(_ mode: NSLineBreakMode) -> UIView {
        if let _ = self as? UILabel {
            (self as! UILabel).lineBreakMode = mode
        }
        
        return self
    }
    
    @discardableResult public func adjustedFontSizeToFitWidth(_ adjusted: Bool = true) -> UIView {
        if let _ = self as? UILabel {
            (self as! UILabel).adjustsFontSizeToFitWidth = adjusted
        }
        
        return self
    }
    
    @discardableResult public func setSymbol(symbolName: String, pointSize: CGFloat, contentMode: UIImageView.ContentMode, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale, tintColor: UIColor) -> UIView {
        if let _ = self as? UIImageView {
            let configuration                  = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
            let image                          = UIImage(systemName: symbolName, withConfiguration: configuration)
            (self as! UIImageView).image       = image
            (self as! UIImageView).tintColor   = tintColor
            (self as! UIImageView).contentMode = contentMode
        
        } else if let _ = self as? UIButton {
            let configuration                  = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
            let image                          = UIImage(systemName: symbolName, withConfiguration: configuration)
            (self as! UIButton).setImage(image: image)
            (self as! UIButton).tintColor   = tintColor
            (self as! UIButton).contentMode = contentMode
        }
        
        return self
    }
    
    @discardableResult public func setImage(imageName: String) -> UIView {
        if let _ = self as? UIImageView {
            (self as! UIImageView).image = .init(named: imageName)
            
        } else if let _ = self as? UIButton {
            (self as! UIButton).setImage(.init(named: imageName), for: .normal)
        }
        
        return self
    }
    
    @discardableResult public func setImage(image: UIImage?) -> UIView {
        if let _ = self as? UIImageView {
            (self as! UIImageView).image = image
            
        } else if let _ = self as? UIButton {
            (self as! UIButton).setImage(image, for: .normal)
        }
        
        return self
    }
    
    @discardableResult public func setSystemFont(with size: CGFloat) -> UIView {
        if let label = self as? UILabel {
            label.font = .systemFont(ofSize: size)
            
        } else if let textView = self as? UITextView {
            textView.font = .systemFont(ofSize: size)
            
        } else if let textfield = self as? UITextField {
            textfield.font = .systemFont(ofSize: size)
            
        } else if let button = self as? UIButton {
            button.titleLabel?.font = .systemFont(ofSize: size)
        }
        
        return self
    }
    
    @discardableResult public func setText(_ text: String) -> UIView {
        if let label = self as? UILabel {
            label.text = text
            
        } else if let textView = self as? UITextView {
            textView.text = text
            
        } else if let textField = self as? UITextField {
            textField.text = text
            
        } else if let button = self as? UIButton {
            button.setTitle(text, for: .normal)
            
        } else if let `switch` = self as? UISwitch {
            `switch`.title = text
        }
        
        return self
    }
    
    @discardableResult public func setNumberOfLines(_ numberOfLines: Int) -> UIView {
        if let label = self as? UILabel {
            label.numberOfLines = numberOfLines
        }
        
        return self
    }
    
    @available(*, deprecated, renamed: "targeted")
    public func addTarget(_ target: Any, action: Selector) {
        if self is UIButton {
            (self as! UIButton).addTarget(target, action: action, for: .touchUpInside)
        } else {
            let tap = UITapGestureRecognizer(target: target, action: action)
            addGestureRecognizer(tap)
        }
    }
    
    @discardableResult public func animated(withDuration duration: TimeInterval,
                        andDelay delay: TimeInterval = 0,
                        withOptions options: UIView.AnimationOptions = [.allowUserInteraction, .curveEaseOut],
                        onMainQueue: Bool = true,
                        _ completion: @escaping AnimationComplition,
                        _ endAnimationComplition: FinishedAnimationComplition? = nil) -> UIView {
        
        if onMainQueue {
            DispatchQueue.main.async {
                
                UIView.animate(withDuration: duration,
                               delay: delay,
                               options: options,
                               animations: completion,
                               completion: endAnimationComplition)
            }
        } else {
            UIView.animate(withDuration: duration,
                           delay: delay,
                           options: options,
                           animations: completion,
                           completion: endAnimationComplition)
        }
        
       
        
        return self
    }
    
    @discardableResult public func fonted(ofType type: FontType, size: CGFloat, weight: UIFont.Weight = .regular) -> UIView {
        var font = UIFont()
        
        switch type {
        case .system:
            font = .systemFont(ofSize: size, weight: weight)
        case .custom(let name):
            if let customFont = UIFont(name: name, size: size) {
                font = customFont
            }
        }
        
        if self is UILabel {
            (self as! UILabel).font = font
            
        } else if self is UITextView {
            (self as! UITextView).font = font
            
        } else if self is UIButton {
            (self as! UIButton).titleLabel?.font = font
        }
        
        return self
    }
    
    @discardableResult public func clipsedToBounds(_ clipsed: Bool = true) -> UIView {
        clipsToBounds = clipsed
        return self
    }
    
    @discardableResult public func setPlaceholder(_ text: String) -> UIView {
        if self is UITextField {
            (self as! UITextField).placeholder = text
        }
        
        return self
    }
    
    @discardableResult public func correctsEnteredText(_ corrects: Bool) -> UIView {
        if self is UITextField {
            (self as! UITextField).autocorrectionType = corrects ? .yes : .no
        } else if self is UITextView {
            (self as! UITextView).autocorrectionType =  corrects ? .yes : .no
        }
        
        return self
    }
    
    @discardableResult public func underlined(title: String, tintColor: UIColor? = nil) -> UIView {
        if self is UIButton {
            var attributes: [NSAttributedString.Key : Any] = [.underlineStyle  : NSUnderlineStyle.single.rawValue]
            if let tintColor = tintColor {
                attributes[.foregroundColor] = tintColor
            } else {
                attributes[.foregroundColor] = (self as! UIButton).tintColor
            }
            
            (self as! UIButton).setAttributedTitle(.init(string: title, attributes: attributes), for: .normal)
        }
        
        return self
    }
    
    public func getText() -> String? {
        if self is UITextField {
            return (self as! UITextField).text
            
        } else if self is UITextView {
            return (self as! UITextView).text
            
        } else if self is UIButton {
            return (self as! UIButton).titleLabel?.text
            
        } else if self is UILabel {
            return (self as! UILabel).text
            
        } else {
            return nil
        }
    }
    
    @discardableResult public func notCapitilized(_ type: UITextAutocapitalizationType = .none) -> UIView {
        if self is UITextField {
            (self as! UITextField).autocapitalizationType = type
        } else if self is UITextView {
            (self as! UITextView).autocapitalizationType = type
        }
        
        return self
    }
    
    @discardableResult public func attributedPlaceholder(_ string: String, attributes: [NSAttributedString.Key : Any]?) -> UIView {
        if self is UITextField {
            (self as! UITextField).attributedPlaceholder = NSAttributedString(string: string, attributes: attributes)
        }
        
        return self
    }
    
    
    @discardableResult public func coloredText(_ color: UIColor) -> UIView {
        if self is UILabel {
            (self as! UILabel).textColor = color
            
        } else if self is UIButton {
            (self as! UIButton).setTitleColor(color, for: .normal)
        }
        
        return self
    }
    
    @discardableResult public func targeted(_ target: Any, action: Selector) -> UIView {
        if self is UIButton {
            (self as! UIButton).addTarget(target, action: action, for: .touchUpInside)
        } else {
            let tap = UITapGestureRecognizer(target: target, action: action)
            addGestureRecognizer(tap)
        }
        
        return self
    }
}


//MARK: - Fixing views
extension UIView {
    
    @discardableResult public func centered(in view: UIView) -> UIView {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return self
    }
    
    @discardableResult public func filled(in view: UIView,
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
    
    @discardableResult public func filled(in view: UIView,
                       bellow topView: UIView,
                       withPadding padding: CGFloat = 0) -> UIView {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo:  view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.topAnchor.constraint(equalTo:      topView.bottomAnchor, constant: padding),
            self.bottomAnchor.constraint(equalTo:   view.bottomAnchor)
        ])
        
        return self
    }
    
    @discardableResult public func chain(with action: ChainedAction) -> UIView {
        switch action {
        case .animation(let duration, let delay, let options, let completion, let endAnimationComplition):
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                UIView.animate(withDuration: duration,
                               delay: 0,
                               options: options,
                               animations: completion,
                               completion: endAnimationComplition)
            }
        }
        
        return self
    }
 }


extension Array where Element == UIView {
    @discardableResult public func vstacked(spacing: CGFloat = 0, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution) -> UIView {
        return Object.vstack(arrangedSubviews: self, spacing: spacing, alignment: alignment, distribution: distribution).create()
    }
    
    @discardableResult public func hstacked(spacing: CGFloat = 0, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution) -> UIView {
        return Object.hstack(arrangedSubviews: self, spacing: spacing, alignment: alignment, distribution: distribution).create()
    }
}
