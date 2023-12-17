//
//  Foundation+Extensions.swift
//  SneakerStore
//
//  Created by Zhantore on 13.12.2023.
//

import Foundation
import UIKit

public protocol WithCreation: AnyObject {}

extension NSObject: WithCreation {}

public extension WithCreation where Self: NSObject {
    init(_ closure: (Self) -> Void) {
        self.init()
        closure(self)
    }
}
