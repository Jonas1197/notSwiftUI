//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit


public typealias VoidHandler                 = ()     -> Void
public typealias AnimationComplition         = ()     -> Void
public typealias FinishedAnimationComplition = (Bool) -> Void

public protocol Objectified: UIResponder, NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace, UIFocusItem, UIFocusItemContainer, CALayerDelegate {
    
    
    
    //MARK: - Coloring
    func setGradientBackground(topColor tColor: UIColor,
                               bottomColor bColor: UIColor) -> UIView
    func backgroundColored(_ color: UIColor) -> UIView
    func tintColored(_ color: UIColor)       -> UIView
    func coloredText(_ color: UIColor)       -> UIView
    
    
    
    //MARK: - Layering
    func shadowed(with color: UIColor,
                  offset: CGSize,
                  radius: CGFloat, _ opacity: Float) -> UIView
    func translucent(_ opacity: Float)               -> UIView
    func invisible()                                 -> UIView
    func visible()                                   -> UIView
    func rounded(_ radius: CGFloat)                  -> UIView
    func clipsedToBounds(_ clipsed: Bool)            -> UIView
    func bordered(width: CGFloat, color: UIColor?)   -> UIView
    
    
    
    //MARK: - Text
    func setPlaceholder(_ text: String)                        -> UIView
    func correctsEnteredText(_ corrects: Bool)                 -> UIView
    func underlined(text: String, tintColor: UIColor?)         -> UIView
    func setLinebreakMode(_ mode: NSLineBreakMode)             -> UIView
    func adjustedFontSizeToFitWidth(_ adjusted: Bool)          -> UIView
    func setTextAlignment(_ alignment: NSTextAlignment)        -> UIView
    func setSystemFont(with size: CGFloat)                     -> UIView
    func setText(_ text: String)                               -> UIView
    func setNumberOfLines(_ numberOfLines: Int)                -> UIView
    func fonted(_ font: UIFont)                                -> UIView
    func setSecureTextEntry(_ secure: Bool)                    -> UIView
    func setKeyboardType(_ type: UIKeyboardType)               -> UIView
    func getText()                                             -> String?
    func autoCapitilized(_ type: UITextAutocapitalizationType) -> UIView
    
    func attributedPlaceholder(_ string: String,
                               attributes: [NSAttributedString.Key : Any]?) -> UIView
    func fonted(ofType type: FontType,
                size: CGFloat,
                weight: UIFont.Weight) -> UIView
    
    
    
    //MARK: - Images & Symbols
    func setSymbol(symbolName: String,
                   pointSize: CGFloat,
                   contentMode: UIImageView.ContentMode,
                   weight: UIImage.SymbolWeight,
                   scale: UIImage.SymbolScale,
                   tintColor: UIColor) -> UIView
    func setImage(imageName: String)   -> UIView
    func setImage(image: UIImage?)     -> UIView
    
    
    
    //MARK: - Subviews & Constraints
    func centered(in view: UIView) -> UIView
    func filled(in view: UIView,
                     leadingPadding:  CGFloat,
                     trailingPadding: CGFloat,
                     topPadding:      CGFloat,
                     bottomPadding:   CGFloat) -> UIView
    func filled(in view: UIView,
                bellow topView: UIView,
                withPadding padding: CGFloat) -> UIView
  
    
    
    //MARK: - Utilities
    func chain(with action: ChainedAction)         -> UIView
    func targeted(_ target: Any, action: Selector) -> UIView
    func hidden()                                  -> UIView
    func showing()                                 -> UIView
    
    
    
    //MARK: - Animations
    func actionWithSpringAnimation(_ action: @escaping AnimationComplition) -> UIView
    func shake() -> UIView
    func animated(withDuration duration: TimeInterval,
                        andDelay delay: TimeInterval,
                        withOptions options: UIView.AnimationOptions,
                        onMainQueue: Bool,
                        _ completion: @escaping AnimationComplition,
                        _ endAnimationComplition: FinishedAnimationComplition?) -> UIView
}
