//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit

public enum ChainedAction {
    case animation(duration: TimeInterval,
                   delay: TimeInterval = 0,
                   options: UIView.AnimationOptions = [.allowUserInteraction, .curveEaseOut],
                   completion: AnimationComplition,
                   endAnimationComplition: FinishedAnimationComplition? = nil)
}


//MARK: - Objectified methods
extension UIView: Objectified {
    
    static func animatedOnMainThread(withDuration duration: TimeInterval, delay: TimeInterval = 0, options: AnimationOptions, _ animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: completion)
        }
    }
    
    /**
     Apply a shadow to effect to a the object with a given color, offest, radius and opacity.
     - Parameter color: The color of the rendered shadow effect.
     - Parameter offest: The offset of the rendered shadow effect.
     - Parameter radius: The radius of the rendered shadow effect.
     - Parameter opacity: The opacity of the rendered shadow effect.
     */
    @discardableResult public func shadowed(with color: UIColor, offset: CGSize, radius: CGFloat, _ opacity: Float) -> UIView {
        (self as UIView).layer.shadowColor   = color.cgColor
        (self as UIView).layer.shadowOffset  = offset
        (self as UIView).layer.shadowRadius  = radius
        (self as UIView).layer.shadowOpacity = opacity
        return self
    }
    
    /**
     Changes the opacity property of layer of the current object. Default translucent value is 0.6.
     - Parameter opacity: Opacity value to be applied to the layer.opacity property of the object.
     */
    @discardableResult public func translucent(_ opacity: Float = 0.6) -> Self {
        layer.opacity = opacity
        return self
    }
    
    /**
     Sets the layer.opacity property of the object to 0 hence rendering it invisible.
     */
    @discardableResult public func invisible() -> Self {
        layer.opacity = 0
        return self
    }
    
    /**
     Sets the layer.opacity property of the object to 1 hence rendering it visible.
     */
    @discardableResult public func visible() -> Self {
        layer.opacity = 1
        return self
    }
    
    /**
     Sets the isHidden property of the object to true hence hiding it from the view.
     */
    @discardableResult public func hidden() -> Self {
        isHidden = true
        return self
    }
    
    /**
     Sets the isHidden property of the object to false hence showing it on the view.
     */
    @discardableResult public func showing() -> Self {
        isHidden = false
        return self
    }
    
    /**
     Sets the backgroundColor property of the object with a given UIColor.
     - Parameter color: The set background color.
     */
    @discardableResult public func backgroundColored(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    /**
     Sets the tintColor property of the object with a given UIColor.
     - Parameter color: The set tint color.
     */
    @discardableResult public func tintColored(_ color: UIColor) -> Self {
        tintColor = color
        return self
    }
    
    //TODO:
    @discardableResult public func rounded(_ radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.layoutIfNeeded()
        return self
    }
    
    /**
     Apply a border with a color and width to the object.
     - Parameter width: The width of the rendered border.
     - Parameter color: The color of the rendered border.
     */
    @discardableResult public func bordered(width: CGFloat, color: UIColor? = nil) -> Self {
        guard let color = color else { return self }
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    
    /**
     Sets the lineBreakMode for a UILabel or the  label of a UIButton.
     - Parameter mode: The desired specified break mode.
     */
    @discardableResult public func setLinebreakMode(_ mode: NSLineBreakMode) -> Self {
        if self is UILabel {
            (self as! UILabel).lineBreakMode = mode
            
        } else if self is UIButton {
            if (self as! UIButton).titleLabel != nil {
                (self as! UIButton).titleLabel!.lineBreakMode = mode
            }
        }
        
        return self
    }
    
    
    /**
     Determains whether the label's font adjusts itself according to its width for both a UILabel and the label of a UIButton. The default value is true.
     - Parameter adjusted: The desired boolean value of the set property.
     */
    @discardableResult public func adjustedFontSizeToFitWidth(_ adjusted: Bool = true) -> Self {
        if self is UILabel {
            (self as! UILabel).adjustsFontSizeToFitWidth = adjusted
            
        } else if self is UIButton {
            if (self as! UIButton).titleLabel != nil {
                (self as! UIButton).titleLabel!.adjustsFontSizeToFitWidth = adjusted
            }
        } else if self is UITextView {
            (self as! UITextView).adjustsFontForContentSizeCategory = adjusted
        }
        
        return self
    }
    
    /**
     Set the text alignemnt of a UILabel, UITexView, UITextField text or UIButton label.
     - Parameter alignment: The desired text alignment.
     */
    @discardableResult public func setTextAlignment(_ alignment: NSTextAlignment) -> Self {
        if self is UILabel {
            (self as! UILabel).textAlignment = alignment
        } else if self is UITextView {
            (self as! UITextView).textAlignment = alignment
        } else if self is UITextField {
            (self as! UITextField).textAlignment = alignment
        } else if self is UIButton {
            (self as! UIButton).titleLabel?.textAlignment = alignment
        }
        
        return self
    }
    
    
    /**
     Set an SFSybmol to be presented within an imageView in a button.
     - Parameter symbolName: The SFSymbol's name as appears in the SFSymbols application.
     - Parameter pointSize: The desired point size of the rendered image.
     - Parameter contentMode: The content mode of the rendered image.
     - Parameter weight: The weight of the rendered image.
     - Parameter scale: The scale of the rendered image.
     - Parameter tintColor: The color with which the image is rendered.
     */
    @discardableResult public func setSymbol(symbolName: String, pointSize: CGFloat, contentMode: UIImageView.ContentMode, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale, tintColor: UIColor) -> Self {
        if self is UIImageView {
            let configuration                  = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
            let image                          = UIImage(systemName: symbolName, withConfiguration: configuration)
            (self as! UIImageView).image       = image
            (self as! UIImageView).tintColor   = tintColor
            (self as! UIImageView).contentMode = contentMode
        
        } else if self is UIButton {
            let configuration                  = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
            let image                          = UIImage(systemName: symbolName, withConfiguration: configuration)
            (self as! UIButton).setImage(image: image)
            (self as! UIButton).tintColor   = tintColor
            (self as! UIButton).contentMode = contentMode
        }
        
        return self
    }
    
    /**
     Sets an image for a given image name.
     - Parameter imageName: The name of the desired image.
     */
    @discardableResult public func setImage(imageName: String) -> Self {
        if self is UIImageView {
            (self as! UIImageView).image = .init(named: imageName)
            
        } else if self is UIButton {
            (self as! UIButton).setImage(.init(named: imageName), for: .normal)
        }
        
        return self
    }
    
    /**
     Sets an image for a given image object.
     - Parameter image: The UIImage object provided.
     */
    @discardableResult public func setImage(image: UIImage?) -> Self {
        if let _ = self as? UIImageView {
            (self as! UIImageView).image = image
            
        } else if let _ = self as? UIButton {
            (self as! UIButton).setImage(image, for: .normal)
        }
        
        return self
    }
    
    /**
     Sets font as a system font for a given UILabel, UItextView, UItextField or UIButton with a given size.
     - Parameter size: The size of the rendered font.
     */
    @discardableResult public func setSystemFont(with size: CGFloat) -> Self {
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
    
    /**
     Sets the text for a given UILabel, UITextView, UITextField, UIButton or a UISwitch.
     - Parameter text: The text to be set.
     */
    @discardableResult public func setText(_ text: String) -> Self {
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
    
    /**
     Sets the number of maximum lines to be rendered for a UILabel.
     */
    @discardableResult public func setNumberOfLines(_ numberOfLines: Int) -> Self {
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
    
    /**
     Performs an animation with a duration, delay, options, whether to perform the animation on the main queue or not (will be performed on main queue by default) and provides a compliton once the animation has finished.
     - Parameter duration: The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
     - Parameter delay: The amount of time (measured in seconds) to wait before beginning the animations. By default this value will be 0 to begin the animations immediately.
     - Parameter options: A mask of options indicating how you want to perform the animations. For a list of valid constants, see
     - Parameter onMainQueue: Decides whether to run the animations on the main queue or not.
     - Parameter complition: A block object containing the changes to commit to the views. This is where you programmatically change any animatable properties of the views in your view hierarchy. This block takes no parameters and has no return value. This parameter must not be NULL.
     - Parameter endAnimationComplition: A block object to be executed when the animation sequence ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle. This parameter may be NULL.
     */
    @discardableResult public func animated(withDuration duration: TimeInterval,
                        andDelay delay: TimeInterval = 0,
                        withOptions options: UIView.AnimationOptions = [.allowUserInteraction, .curveEaseOut],
                        onMainThread: Bool = true,
                        _ completion: @escaping AnimationComplition,
                        _ endAnimationComplition: FinishedAnimationComplition? = nil) -> Self {
        
        if onMainThread {
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
    
    /**
     Apply a font for a UILabel, UITextField, UITextView or a label of a UIButton.
     - Parameter tpye: The type of font to be rendered (custom font or a the system font).
     - Parameter size: The size of the rendered font.
     - Parameter weight: The weight of the rendered font.
     */
    @discardableResult public func fonted(ofType type: FontType, size: CGFloat, weight: UIFont.Weight = .regular) -> Self {
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
            
        } else if self is UITextField {
            (self as! UITextField).font = font
        }
        
        return self
    }
    
    /**
     A Boolean value that indicates whether the text object disables text copying and, in some cases, hides the text that the user enters (this is true by default).
     - Parameter secure: A boolean indicating whether secure text entry is active or not.
     */
    @discardableResult public func setSecureTextEntry(_ secure: Bool = true) -> Self {
        if self is UITextField {
            (self as! UITextField).isSecureTextEntry = secure
        }
        
        return self
    }
    
    /**
     Set the keyboard type to be used by the user upon editing.
     - Parameter type: The desired type of the keyboard.
     */
    @discardableResult public func setKeyboardType(_ type: UIKeyboardType) -> Self {
        if self is UITextField {
            (self as! UITextField).keyboardType = type
        } else if self is UITextView {
            (self as! UITextView).keyboardType = type
        }
        
        return self
    }
    
    /**
     Sets the font of a UILabel, UITextField, UITextView or a UIButton with a given font object.
     */
    @discardableResult public func fonted(_ font: UIFont) -> UIView {
        if self is UILabel {
            (self as! UILabel).font = font
        } else if self is UITextView {
            (self as! UITextView).font = font
        } else if self is UIButton {
            (self as! UIButton).titleLabel?.font = font
        } else if self is UITextField {
            (self as! UITextField).font = font
        }
        
        return self
    }
    
    /**
     Determines whether subviews are confined to the bounds of the view - sets 'true' by default.
     */
    @discardableResult public func clipsedToBounds(_ clipsed: Bool = true) -> Self {
        clipsToBounds = clipsed
        return self
    }
    
    /**
     Sets the placeholder for a given UITextField.
     - Parameter placeholder: The placeholder text to be presented.
     */
    @discardableResult public func setPlaceholder(_ placeholder: String) -> Self {
        if self is UITextField {
            (self as! UITextField).placeholder = placeholder
        }
        
        return self
    }
    
    /**
     Corrects the text entered within a UITextField or a UITextView (this is true by default).
     - Parameter corrects: Specifies whether to correct the entered text or not.
     */
    @discardableResult public func correctsEnteredText(_ corrects: Bool = true) -> Self {
        if self is UITextField {
            (self as! UITextField).autocorrectionType = corrects ? .yes : .no
        } else if self is UITextView {
            (self as! UITextView).autocorrectionType =  corrects ? .yes : .no
        }
        
        return self
    }
    
    /**
     Adds an underlined text to a UILabel, UITextField, UIButton or a UITextView.
     - Parameter title: The underlined text to be displayed.
     - Parameter tintColor: The color of the rendered underlined text.
     */
    @discardableResult public func underlined(text: String, tintColor: UIColor? = nil) -> Self {
        var attributes: [NSAttributedString.Key : Any] = [.underlineStyle  : NSUnderlineStyle.single.rawValue]
        if let tintColor = tintColor {
            attributes[.foregroundColor] = tintColor
        } else {
            attributes[.foregroundColor] = (self as! UIButton).tintColor
        }
        
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        
        if self is UIButton {
            (self as! UIButton).setAttributedTitle(attributedText, for: .normal)
            
        } else if self is UILabel {
            (self as! UILabel).attributedText = attributedText
            
        } else if self is UITextField {
            (self as! UITextField).attributedText = attributedText
            
        } else if self is UITextView {
            (self as! UITextView).attributedText = attributedText
        }
        
        return self
    }
    
    /**
     Retrieve the text for a UITextField, UITextView, UIButton's label or a UILabel.
     */
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
    
    /**
     Retrieve the placeholder text for a UITextField.
     */
    public func getPlaceholder() -> String? {
        if self is UITextField {
            return (self as! UITextField).placeholder
        } else {
            return nil
        }
    }
    
    /**
     Auto capitalizes sentences (this is set to auto capitalize sentences by default).
     */
    @discardableResult public func autoCapitilized(_ type: UITextAutocapitalizationType = .sentences) -> Self {
        if self is UITextField {
            (self as! UITextField).autocapitalizationType = type
        } else if self is UITextView {
            (self as! UITextView).autocapitalizationType = type
        }
        
        return self
    }
    
    /**
     Sets an attributed placeholder for a UITextField.
     - Parameter string: The attributed text to be displayed.
     - Parameter attributes: The attributes to be applied to the displayed text.
     */
    @discardableResult public func attributedPlaceholder(_ string: String, attributes: [NSAttributedString.Key : Any]?) -> Self {
        if self is UITextField {
            (self as! UITextField).attributedPlaceholder = NSAttributedString(string: string, attributes: attributes)
        }
        
        return self
    }
    
    /**
     Sets the color of the displayed text for a UILabel, UITextField, UIButton or a UITextView.
     - Parameter color: The set color.
     */
    @discardableResult public func coloredText(_ color: UIColor) -> UIView {
        if self is UILabel {
            (self as! UILabel).textColor = color
            
        } else if self is UIButton {
            (self as! UIButton).setTitleColor(color, for: .normal)
             
        } else if self is UITextField {
            (self as! UITextField).textColor = color
            
        } else if self is UITextView {
            (self as! UITextView).textColor = color
        }
        
        return self
    }
    
    /**
     Adds an action to a UIButton or a view. Action added for any view which is not a UIButton will be implemented as a tap.
     - Parameter target: The target object—that is, the object whose action method is called. If you specify nil, UIKit searches the responder chain for an object that responds to the specified action message and delivers the message to that object.
     
     - Parameter action: A selector identifying the action method to be called. You may specify a selector whose signature matches any of the signatures in Listing 1. This parameter must not be nil.
     */
    @discardableResult public func targeted(_ target: Any, action: Selector) -> Self {
        if self is UIButton {
            (self as! UIButton).addTarget(target, action: action, for: .touchUpInside)
        } else {
            let tap = UITapGestureRecognizer(target: target, action: action)
            addGestureRecognizer(tap)
        }
        
        return self
    }
    
    @discardableResult public func performs(_ action: @escaping () -> ()) -> Self {
        if self is UIButton {
            (self as! UIButton).addAction(action)
            
        } else {
            addAction(action)
        }
        
        return self
    }
}


//MARK: - Fixing views
extension UIView {
    
    @discardableResult public func centered(in view: UIView) -> Self {
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
                     bottomPadding:   CGFloat = 0) -> Self {
        
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
                       withPadding padding: CGFloat = 0) -> Self {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo:  view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.topAnchor.constraint(equalTo:      topView.bottomAnchor, constant: padding),
            self.bottomAnchor.constraint(equalTo:   view.bottomAnchor)
        ])
        
        return self
    }
    
    @discardableResult public func chain(with action: ChainedAction) -> Self {
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
    
    /**
     Apply a gradient starting from the top and moving all the way to the bottom.
     - Parameter topColor: The color which starts at the top.
     - Parameter bottomColor: The color which continues after the top color ahs been applied.
     */
    @discardableResult public func setGradientBackground(topColor tColor: UIColor, bottomColor bColor: UIColor) -> Self {
        let gradientLayer       = CAGradientLayer()
        gradientLayer.colors    = [tColor.cgColor, bColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame     = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
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
