//
//  Box.swift
//  Box_Swift
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import Foundation
import Box

extension NSDataProcessor where T == NSString {
    public func processData(_ data: Data) -> String? {
        return String.init(data: data, encoding: .utf8)
    }
}

extension NSDataProcessor where T == NSArray {
    public func processDataAsArrayOfInt(_ data: Data) -> [Int] {
        return [] //<-- TDD
    }
}

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

extension NSBox where T == NSDictionaryStringAny {
    public var dict: [String: Any] {
        return (value as? [String: Any]) ?? [:]
    }
}