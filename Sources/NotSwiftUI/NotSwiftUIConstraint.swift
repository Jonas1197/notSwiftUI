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
}

public struct NotSwiftUIConstraint {
    var anchor:         SpecifiedAnchor
    var relativeAnchor: Any
    var constant:       CGFloat
    
    public init(anchor: SpecifiedAnchor, relativeAnchor: Any, constant: CGFloat) {
        self.anchor     = anchor
        self.relativeAnchor = relativeAnchor
        self.constant   = constant
    }
}
