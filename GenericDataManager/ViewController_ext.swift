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
        let session = ViewController.dataTask.urlSession
        ViewController.dataTask.dataTask(urlRequest: session.urlRequest()
            , dataProcessor: session.dataProcessor()
            , completion: { (d, r, e) in
                print(d!.dictionary.keys.first!)
                print(d!.dictionary.values.first!)
        })
        
        //Generic Parameter could not be inferred
//        Cool(ViewController.dataTask).dataTask(query: ()
//            , completion: { (d, r, e) in
//                print(d!.dictionary.keys.first!)
//                print(d!.dictionary.values.first!)
//        })
        
        // global function `Warm` has no issues inverring the Template type
        Warm(ViewController.dataTask).dataTask(completion: { (d, r, e) in
                print(d!.dictionary.keys.first!)
                print(d!.dictionary.values.first!)
        })
        
        // A method also has no issues inferring the Template type
        Hot().hot(ViewController.dataTask).dataTask(query: NSNull()
            , completion: { (d, r, e) in
                print(d!.dictionary.keys.first!)
                print(d!.dictionary.values.first!)
        })
    }
}



public struct Cool<PR,S>
    where PR: AnyObject, S: GenericURLSession, S: DataProcessor, S: URLRequestMaker
{
    let webService: WebService<PR,S>
    //let urlSession: S
}

extension Cool {
    public func dataTask(query: S.QUERY_TYPE, completion: @escaping (PR?, URLResponse?, Error?) -> ())
    {
        let dp: (Data?) -> PR? =  { self.webService.urlSession.dataProcessor()($0) as? PR }
        webService.dataTask(urlRequest: webService.urlSession.urlRequest(query)
            , dataProcessor: dp
            , completion: completion)
    }
    
    public static func cool<PR, S>(_ webservice: WebService<PR, S>) -> Cool<PR, S> {
        return Cool<PR, S>(webService: webservice)
    }
}
extension Cool where S.QUERY_TYPE == NSNull {
    public func dataTask(completion: @escaping (PR?, URLResponse?, Error?) -> ()) {
        dataTask(query: NSNull(), completion: completion)
    }
}

public func Warm<PR, S>(_ webservice: WebService<PR, S>) -> Cool<PR, S> {
    return Cool<PR, S>(webService: webservice)
}

public struct Hot {
    func hot<PR, S>(_ webservice: WebService<PR, S>) -> Cool<PR, S> {
        return Cool<PR, S>(webService: webservice)
    }
}

