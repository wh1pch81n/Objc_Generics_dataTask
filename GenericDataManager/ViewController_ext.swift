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
	public func doIt() {
		let dataManager = GenericDataManager<NSString>()
		
		let urlRequest = URLRequest(url: URL(string: "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC")!)
		
		dataManager.dataTask(with: urlRequest
			, dataProcessor: processor(_:)) {
				print("a", $0.0 ?? "")
		}
		
		let dataManagerBox = GenericDataManager<BoxString>()
		
		dataManagerBox.dataTask(with: urlRequest, dataProcessor: processorBox(_:)) {
			print("b", $0.0?.str ?? "")
		}
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
}
