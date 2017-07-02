//
//  Box.swift
//  Box_Swift
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import Foundation
import Box

extension NSBox where T == NSString {
    public var value_s: String {
        return value as String
    }
}

extension NSBox where T == NSNumber {
    public var integer: Int {
        return value.intValue
    }
    public var double: Double {
        return value.doubleValue
    }
}

extension NSBox where T == NSNumber {
    public func method(_ m: (Int) -> ()) {
        m(value.intValue)
    }
    public func method(_ m: (Bool) -> ()) {
        m(value.boolValue)
    }
}
