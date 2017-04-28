//
//  ViewController_ext.swift
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import Foundation

extension ViewController {
	public func doIt() {
		let dataManager = GenericDataManager<NSString>()
		
		dataManager.dataTask(with: URLRequest(url: URL(string: "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC")!)
			, dataProcessor: processor(_:)) {
				print("", $0.0 ?? "")
		}
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
