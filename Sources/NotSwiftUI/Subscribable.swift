//
//  Subscribable.swift
//  
//
//  Created by St. John on 04/09/2022.
//

import UIKit
import Combine

public protocol Subscribable: AnyObject {
    var cancellables: [AnyCancellable] { get set }
    
    func subscribe<P: Publisher>(to keyPath: KeyPath<Self, P>,
                                          handler: @escaping (P.Output) -> Void) where P.Failure == Never
}

extension Subscribable {
    public func subscribe<P: Publisher>(to keyPath: KeyPath<Self, P>,
                                          handler: @escaping (P.Output) -> Void) where P.Failure == Never {
        self[keyPath: keyPath].sink {
            handler($0)
        }.store(in: &cancellables)
    }
}
