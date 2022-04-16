//
//  Closurable.swift
//  
//
//  Created by Jonas Gamburg on 16/04/2022.
//

import Foundation
import UIKit

private var actionKey: Void?


//MARK: - UIButton
//extension UIButton {
//    private var _action: () -> () {
//        get {
//            return objc_getAssociatedObject(self, &actionKey) as! () -> ()
//        }
//        set {
//            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//
//    convenience public init(title: String?, action: @escaping () -> ()) {
//        self.init()
//        self.setTitle(title, for: .normal)
//        self.addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)
//        self._action = action
//    }
//
//    public func addAction(_ action: @escaping () -> ()) {
//        self.addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)
//        self._action = action
//    }
//
//    @objc private func pressed(_ sender: UIButton) {
//        _action()
//    }
//}


//MARK: - UITapGestureRecognizer
extension UIView {
    private var _action: () -> () {
        get {
            return objc_getAssociatedObject(self, &actionKey) as! () -> ()
        }
        set {
            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    convenience public init(action: @escaping () -> ()) {
        self.init()
        
        if self is UIButton {
            (self as! UIButton).addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)
            
        } else {
            let tap = UITapGestureRecognizer(target: self, action: #selector(pressed(_:)))
            self.addGestureRecognizer(tap)
        }
        
        self._action = action
    }

    public func addAction(_ action: @escaping () -> ()) {
        if self is UIButton {
            (self as! UIButton).addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)
            
        } else {
            let tap = UITapGestureRecognizer(target: self, action: #selector(pressed(_:)))
            self.addGestureRecognizer(tap)
        }
        
        self._action = action
    }

    @objc private func pressed(_ sender: UIButton) {
        _action()
    }
}
