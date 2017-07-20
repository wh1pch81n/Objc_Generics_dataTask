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

public protocol URLRequestMaker {
    associatedtype QUERY_TYPE
    func urlRequest(_ query: QUERY_TYPE) -> () -> URLRequest
}
public protocol DataProcessor {
    associatedtype PROCESSED_TYPE
    func dataProcessor() -> (Data?) -> PROCESSED_TYPE?
}

extension SimpleDataSession: URLRequestMaker {
    @objc public func urlRequest(_ data: NSNull = NSNull()) -> () -> URLRequest {
        return {
            URLRequest(url: URL(string: "https://api.myjson.com/bins/e4xc3")!)
        }
    }
}
extension SimpleDataSession: DataProcessor {
    @objc public func dataProcessor() -> (Data?) -> MyDictionary<NSString, AnyObject>? {
        return { data in
            let json = data.flatMap({ try? JSONSerialization.jsonObject(with: $0, options: []) })
            guard let dict = json as? [NSString:AnyObject] else {
                return nil
            }
            let md = MyDictionary<NSString, AnyObject>()
            md.dictionary = dict
            return md
        }
    }
}

extension ViewController {
    static let dataTask = WebService<MyDictionary<NSString, AnyObject>, SimpleDataSession>(urlSession: SimpleDataSession())
}

extension NSObject {
    @objc func experiment() {
        
        let l = UILabel()
        l.text = "hello"
        
        // Using raw method call
        let session = ViewController.dataTask.urlSession
        ViewController.dataTask.dataTask(urlRequest: session.urlRequest()
            , dataProcessor: session.dataProcessor()
            , completion: { (d, r, e) in
                print(d!.dictionary.keys.first!)
                print(d!.dictionary.values.first!)
        })
        
        // Wrapping in a struct to make it more swifty
        Cool(ViewController.dataTask).dataTask(completion: { (d, r, e) in
            print(d!.dictionary.keys.first!)
            print(d!.dictionary.values.first!)
        })
    }
}

public struct Cool<PR,S>
    where PR: AnyObject, S: GenericURLSession, S: DataProcessor, S: URLRequestMaker
{
    let webService: WebService<PR,S>
    public init(_ webService: WebService<PR, S>) {
        self.webService = webService
    }
}

extension Cool {
    public func dataTask(query: S.QUERY_TYPE, completion: @escaping (PR?, URLResponse?, Error?) -> ())
    {
        let dp: (Data?) -> PR? =  { self.webService.urlSession.dataProcessor()($0) as? PR }
        webService.dataTask(urlRequest: webService.urlSession.urlRequest(query)
            , dataProcessor: dp
            , completion: completion)
    }
}

extension Cool where S.QUERY_TYPE == NSNull {
    public func dataTask(completion: @escaping (PR?, URLResponse?, Error?) -> ()) {
        dataTask(query: NSNull(), completion: completion)
    }
}

