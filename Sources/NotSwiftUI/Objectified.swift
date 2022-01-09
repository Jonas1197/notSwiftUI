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
    
    @discardableResult func shadowed(with color: UIColor, offset: CGSize, radius: CGFloat, _ opacity: Float) -> UIView
    @discardableResult func translucent(_ opacity: Float)            -> UIView
    @discardableResult func invisible()                              -> UIView
    @discardableResult func visible()                                -> UIView
    @discardableResult func backgroundColored(_ color: UIColor)      -> UIView
    @discardableResult func tintColored(_ color: UIColor)            -> UIView
    @discardableResult func hidden()                                 -> UIView
    @discardableResult func showing()                                -> UIView
    @discardableResult func rounded(_ radius: CGFloat)               -> UIView
    @discardableResult func bordered(width: CGFloat, color: UIColor) -> UIView
    @discardableResult func setSystemFont(with size: CGFloat)        -> UIView
    @discardableResult func setText(_ text: String)                  -> UIView
    @discardableResult func setImage(imageName: String)              -> UIView
    @discardableResult func setImage(image: UIImage?)                -> UIView
    
    /**
     Determines whether subviews are confined to the bounds of the view - sets 'true' by default.
     */
    @discardableResult func clipsedToBounds(_ clipsed: Bool)         -> UIView
    
    @discardableResult func setSymbol(symbolName: String,
                   pointSize: CGFloat,
                   contentMode: UIImageView.ContentMode,
                   weight: UIImage.SymbolWeight,
                   scale: UIImage.SymbolScale,
                   tintColor: UIColor) -> UIView
    
    @discardableResult func centered(in view: UIView) -> UIView
    
    @discardableResult func filled(in view: UIView,
                     leadingPadding:  CGFloat,
                     trailingPadding: CGFloat,
                     topPadding:      CGFloat,
                     bottomPadding:   CGFloat) -> UIView
    
    @discardableResult func filled(in view: UIView,
                bellow topView: UIView,
                withPadding padding: CGFloat) -> UIView
  
    @discardableResult func animated(withDuration duration: TimeInterval,
                        andDelay delay: TimeInterval,
                        withOptions options: UIView.AnimationOptions,
                        _ completion: @escaping AnimationComplition,
                        _ endAnimationComplition: FinishedAnimationComplition?) -> UIView
    
    @discardableResult func fonted(ofType type: FontType, size: CGFloat, weight: UIFont.Weight) -> UIView
    
    
    @discardableResult func chain(with action: ChainedAction) -> UIView
}
