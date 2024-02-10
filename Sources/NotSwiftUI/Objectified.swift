//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit

public typealias VoidHandler = () -> Void
public typealias AnimationComplition = () -> Void
public typealias FinishedAnimationComplition = (Bool) -> Void

public protocol Objectified:
    UIResponder,
    NSCoding,
    UIAppearance,
    UIAppearanceContainer,
    UIDynamicItem,
    UITraitEnvironment,
    UICoordinateSpace,
    UIFocusItem,
    UIFocusItemContainer,
    CALayerDelegate {
    
    
    //MARK: - Coloring
    func setGradientBackground(
        topColor tColor: UIColor,
        bottomColor bColor: UIColor
    ) -> UIView
    
    func backgroundColored(_ color: UIColor) -> UIView
    func titleColor(_ color: UIColor) -> UIView
    func tintColored(_ color: UIColor) -> UIView
    func coloredText(_ color: UIColor) -> UIView
    
    
    //MARK: - Layering
    func shadowed(
        with color: UIColor,
        offset: CGSize,
        radius: CGFloat, _ opacity: Float
    ) -> UIView
    
    func bordered(
        width: CGFloat,
        color: UIColor?
    ) -> UIView
    
    func visible() -> UIView
    func invisible() -> UIView
    func translucent(_ opacity: Float) -> UIView
    
    func rounded(_ radius: CGFloat) -> UIView
    func clipsedToBounds(_ clipsed: Bool) -> UIView
    
    
    
    //MARK: - Text
    
    func getText() -> String?
    func getPlaceholder() -> String?
    
    func attributedPlaceholder(
        _ string: String,
        attributes: [NSAttributedString.Key : Any]?
    ) -> UIView
    
    func fonted(
        ofType type: FontType,
        size: CGFloat,
        weight: UIFont.Weight
    ) -> UIView
    
    
    func fonted(_ font: UIFont) -> UIView
    func setText(_ text: String) -> UIView
    func underlined(text: String, tintColor: UIColor?) -> UIView
    func setSystemFont(with size: CGFloat) -> UIView
    func setPlaceholder(_ text: String) -> UIView
    func setKeyboardType(_ type: UIKeyboardType) -> UIView
    func autoCapitilized(_ type: UITextAutocapitalizationType) -> UIView
    func setNumberOfLines(_ numberOfLines: Int) -> UIView
    func setTextAlignment(_ alignment: NSTextAlignment) -> UIView
    func setLinebreakMode(_ mode: NSLineBreakMode) -> UIView
    func setSecureTextEntry(_ secure: Bool) -> UIView
    func correctsEnteredText(_ corrects: Bool) -> UIView
    func adjustedFontSizeToFitWidth(_ adjusted: Bool) -> UIView
    
    
    //MARK: - Images & Symbols
    func setSymbol(
        symbolName: String,
        pointSize: CGFloat,
        contentMode: UIImageView.ContentMode,
        weight: UIImage.SymbolWeight,
        scale: UIImage.SymbolScale,
        tintColor: UIColor
    ) -> UIView

    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) -> UIView

    func setImage(imageName: String) -> UIView
    func setImage(image: UIImage?) -> UIView
    
    
    //MARK: - Subviews & Constraints
    func filled(
        in view: UIView,
        leadingPadding: CGFloat,
        trailingPadding: CGFloat,
        topPadding: CGFloat,
        bottomPadding: CGFloat
    ) -> UIView
    
    func filled(
        in view: UIView,
        bellow topView: UIView,
        withPadding padding: CGFloat
    ) -> UIView
    
    func placed(in parentView: UIView) -> UIView
    func centered(in view: UIView) -> UIView
    func constrainted( _ constraints: [NotSwiftUIConstraint]) -> UIView
    
    
    //MARK: - Utilities
    func targeted(
        _ target: Any,
        action: Selector
    ) -> UIView
    
    func hidden() -> UIView
    func showing() -> UIView
    
    func chain(with action: ChainedAction) -> UIView
    func userInteractable(_ enabled: Bool) -> UIView
    
    
    //MARK: - Animations
    func actionWithSpringAnimation(
        springDuration duration: TimeInterval,
        scaleValue scale: CGFloat,
        _ action: @escaping AnimationComplition
    ) -> UIView
    
    func shake() -> UIView
    
    func animated(
        withDuration duration: TimeInterval,
        andDelay delay: TimeInterval,
        withOptions options: UIView.AnimationOptions,
        onMainThread: Bool,
        _ completion: @escaping AnimationComplition,
        _ endAnimationComplition: FinishedAnimationComplition?
    ) -> UIView
    
    static func animatedOnMainThread(
        withDuration duration: TimeInterval,
        delay: TimeInterval,
        options: UIView.AnimationOptions,
        _ animations: @escaping AnimationComplition,
        completion: (FinishedAnimationComplition)?)
}
