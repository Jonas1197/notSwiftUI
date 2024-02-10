//
//  NotSwiftUIConstraint.swift
//  
//
//  Created by Jonas Gamburg on 22.11.22.
//

import UIKit

public enum SpecifiedAnchor {
    case top, bottom
    case leading, trailing
    case centerX, centerY
    case width, height
}

public struct NotSwiftUIConstraint {
    var anchor: SpecifiedAnchor?
    var constant: CGFloat
    var relativeAnchor: Any?
    var layoutConstraint: NSLayoutConstraint?
    
    public init(
        anchor: SpecifiedAnchor? = nil,
        constant: CGFloat = 0,
        relativeAnchor: Any? = nil,
        layoutConstraint: NSLayoutConstraint? = nil
    ) {
        self.anchor = anchor
        self.constant = constant
        self.relativeAnchor = relativeAnchor
        self.layoutConstraint = layoutConstraint
    }
}
