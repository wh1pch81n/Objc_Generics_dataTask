//
//  ViewController_ext.swift
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import Foundation
import Box
import Box_Swift

//extension GenericDataManager {
//    func s_dataTask<V>(request: URLRequest
//        , dataProcessor: (Data?) -> Array<V>?
//        , completion: (Array<V>?, URLResponse?, Error?) -> ())
//    {
//        
//    }
//}

extension NSObject {
    @objc func experiment() {
        let b = ViewController().box
        let n = ViewController().nox
        print(b.value_s)
        n.method { (_b: Bool) in
            print("bool:", _b)
        }
        n.method { (_n: Int) in
            print("int:", _n)
        }
    }
}
//
//extension NSBox where T == NSString {
//    @nonobjc
//    var value: String {
//        return self.value(forKey: "value") as! String
//    }
//}



//class Box<T> {
//    private(set) var box = NSBox<AnyObject>()
//}

//extension SwiftViewController {
//    @objc private var _objcThing: Any {
//        return thing.box
//    }
//}
//
//class SwiftViewController: UIViewController {
//    public var thing = Box<String>()
//}

