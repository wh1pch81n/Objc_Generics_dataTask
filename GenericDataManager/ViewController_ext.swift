//
//  ViewController_ext.swift
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import Foundation

class BoxString {
	var str: String
	init?(_ s: String?) {
		if let _s = s {
			str = _s
		} else {
			return nil
		}
	}
}

extension ViewController {
    
    @nonobjc public var arr_swift: gdm<[String:Any]> {
        let g = gdm<[String:Any]>()
        g.internalGdm = __arr_swift as! GenericDataManager<AnyObject>
        return g
    }
    
	public func doIt() {
        
       // NSArray() as Array
        
        //let a: Any = Col().something
        //let aa: AnyObject = something
        
        //let arr: NSArray = globalBox.value!
//        let arr2: Array<String> = globalBox.value!
        
        
        let b = NSBox<NSString>()
        b.value = "4"
        
        let d: String? = b.value as String?
        
		let dataManager = GenericDataManager<NSString>()
		
		let urlRequest = URLRequest(url: URL(string: "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC")!)
		
        arr_swift.dataTask(with: urlRequest, dataProcessor: { (d:Data?) -> [String : Any]? in
            return (try? JSONSerialization.jsonObject(with: d ?? Data(), options: [])) as? [String : Any]
        }) { (d: [String : Any]?, r: URLResponse?, e: Error?) in
            print(d)
        }
        
        gdm<String>().dataTask(with: urlRequest, dataProcessor: processor2(_:)) { (m, r, e) in
                    print("aa", m ?? "")

        }
            
//            .dataTask(with: urlRequest, dataProcessor: processor) { (m, r, e) in
//            print("a", m ?? "")
//        }
        
//		dataManager.dataTask(with: urlRequest
//			, dataProcessor: processor(_:)) {
//				print("a", $0.0 ?? "")
//		}
//		
//		let dataManagerBox = GenericDataManager<BoxString>()
//		
//		dataManagerBox.dataTask(with: urlRequest, dataProcessor: processorBox(_:)) {
//			print("b", $0.0?.str ?? "")
//		}
//        
////        self.boxing?.dataTask(with: <#T##URLRequest#>, dataProcessor: <#T##(Data?) -> NSBox?#>, completion: { (box, r, e) in
////            box?.value
////        })
//        
//        
//        arr?.dataTask(with: urlRequest, dataProcessor: { (d) -> NSArray? in
//            return self.processorGimmeArray(d) as NSArray?
//        }, completion: { (a, r, e) in
//            print(a)
//            
//        })
	}
	
    private func processorGimmeArray(_ data: Data?) -> Array<String>? {
        return [""]
    }
    
	private func processorBox(_ data: Data?) -> BoxString? {
		return BoxString(processor(data) as String?)
	}
	
	private func processor(_ data: Data?) -> NSString? {
		guard let _data = data
			, let json = (try? JSONSerialization.jsonObject(with: _data, options: [])) as? NSDictionary
			, let urlString = json.value(forKeyPath: "data.image_url") as? NSString
			else
		{
			return nil
		}
		
		return urlString
	}

    private func processor2(_ data: Data?) -> String? {
        guard let _data = data
            , let json = (try? JSONSerialization.jsonObject(with: _data, options: [])) as? NSDictionary
            , let urlString = json.value(forKeyPath: "data.image_url") as? String
            else
        {
            return nil
        }
        
        return urlString
    }

    
    
}

class Box<T> {
    let val: T
    init?(value: T?) {
        if value == nil {
            return nil
        }
        self.val = value!
    }
}

public class gdm<M>: NSObject {
    var internalGdm = GenericDataManager<AnyObject>()
    
    public func dataTask(with urlRequest: URLRequest, dataProcessor: @escaping (Data?) -> M?, completion: @escaping (M?, URLResponse?, Error?) -> ())
    {
        internalGdm.dataTask(with: urlRequest, dataProcessor: { (d: Data?) -> AnyObject? in
            return Box<M>(value: dataProcessor(d))
        }, completion: { (box: AnyObject?, r: URLResponse?, e: Error?) in
            if let b = box as? Box<M> {
                completion(b.val, r, e)
                return
            }
            completion(nil, r, e)
        })
    }
}

extension GenericDataManager {
//    @nonobjc func luck<H: Hashable>(_ m: H) {
//        
//    }
    
//    func myDataTask(_ request: () -> URLRequest, dataProcessor: (Data?) -> T?) {
//        
//    }
}
