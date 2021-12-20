//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit

public protocol Objectified: UIResponder, NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace, UIFocusItem, UIFocusItemContainer, CALayerDelegate {
    func shadowed(with color: UIColor, _ offset: CGSize, radius: CGFloat, _ opacity: Float) -> UIView
    func translucent(_ opacity: Float) -> UIView
    func invisible() -> UIView
    func backgroundColored(_ color: UIColor) -> UIView
    func tintColored(_ color: UIColor) -> UIView
    func hidden() -> UIView
    func showing() -> UIView
    func rounded(_ radius: CGFloat) -> UIView
    func bordered(width: CGFloat, color: UIColor) -> UIView
    
    func center(in view: UIView) -> UIView
    func fill(in view: UIView,
                     leadingPadding:  CGFloat,
                     trailingPadding: CGFloat,
                     topPadding:      CGFloat,
                     bottomPadding:   CGFloat) -> UIView
}
