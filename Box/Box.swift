//
//  Box.swift
//  Box
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import Foundation



public class Box<T> {
    public var value: T
    public init(value: T) {
        self.value = value
    }
}

extension MyArray where T == NSString {
    public func array_s() -> [String] {
        return array as [String]
    }
}

extension UIViewController {
    //static var m =
}

public class WrapperArray<T: AnyObject> {
    private let a: MyArray<T>
//    public var thing: T? {
//        return a.array.first
//    }
//
//    public var thing2 = { () -> (Int) -> NSString? in
//        let f = first(MyArray<NSString>())
//        return { (n) in
//            return f
//        }
//    }()
//
    public init(_ array: MyArray<T>) {
        self.a = array
    }
}








