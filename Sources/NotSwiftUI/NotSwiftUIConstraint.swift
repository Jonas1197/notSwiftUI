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
    var anchor:   SpecifiedAnchor
    var relativeTo: NSLayoutAnchor<AnyObject>
    var constant: CGFloat
}
