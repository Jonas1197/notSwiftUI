//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit

public typealias AnimationComplition         = () -> Void
public typealias FinishedAnimationComplition = (Bool) -> Void

public protocol Objectified: UIResponder, NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace, UIFocusItem, UIFocusItemContainer, CALayerDelegate {
    
    func shadowed(with color: UIColor, offset: CGSize, radius: CGFloat, _ opacity: Float) -> UIView
    func translucent(_ opacity: Float)                  -> UIView
    func invisible()                                    -> UIView
    func visible()                                      -> UIView
    func backgroundColored(_ color: UIColor)            -> UIView
    func tintColored(_ color: UIColor)                  -> UIView
    func hidden()                                       -> UIView
    func showing()                                      -> UIView
    func rounded(_ radius: CGFloat)                     -> UIView
    func bordered(width: CGFloat, color: UIColor)       -> UIView
    func setSystemFont(with size: CGFloat)              -> UIView
    func setText(_ text: String)                        -> UIView
    func setNumberOfLines(_ numberOfLines: Int)         -> UIView
    func setImage(imageName: String)                    -> UIView
    func setImage(image: UIImage?)                      -> UIView
    func setPlaceholder(_ text: String)                 -> UIView
    func correctsEnteredText(_ corrects: Bool)          -> UIView
    func underlined(title: String, tintColor: UIColor?) -> UIView
    func setLinebreakMode(_ mode: NSLineBreakMode)      -> UIView
    func adjustedFontSizeToFitWidth(_ adjusted: Bool)   -> UIView
    
    /**
     Determines whether subviews are confined to the bounds of the view - sets 'true' by default.
     */
    func clipsedToBounds(_ clipsed: Bool)         -> UIView
    
    func setSymbol(symbolName: String,
                   pointSize: CGFloat,
                   contentMode: UIImageView.ContentMode,
                   weight: UIImage.SymbolWeight,
                   scale: UIImage.SymbolScale,
                   tintColor: UIColor) -> UIView
    
    func centered(in view: UIView) -> UIView
    
    func filled(in view: UIView,
                     leadingPadding:  CGFloat,
                     trailingPadding: CGFloat,
                     topPadding:      CGFloat,
                     bottomPadding:   CGFloat) -> UIView
    
    func filled(in view: UIView,
                bellow topView: UIView,
                withPadding padding: CGFloat) -> UIView
  
    func animated(withDuration duration: TimeInterval,
                        andDelay delay: TimeInterval,
                        withOptions options: UIView.AnimationOptions,
                        onMainQueue: Bool,
                        _ completion: @escaping AnimationComplition,
                        _ endAnimationComplition: FinishedAnimationComplition?) -> UIView
    
    func fonted(ofType type: FontType, size: CGFloat, weight: UIFont.Weight) -> UIView
    
    func getText() -> String?
    
    func attributedPlaceholder(_ string: String, attributes: [NSAttributedString.Key : Any]?) -> UIView
    
    func coloredText(_ color: UIColor) -> UIView
    
    func chain(with action: ChainedAction) -> UIView
}
