//
//  WebClient.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/14/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation

// does only 1 thing, call the web to ask for weather data

protocol Client {
    
    func fetchContent(completion:(_ webResponse: Data?, _ errorString: String?) -> ())
}

class WebClient : Client {
    
    func fetchContent(completion:(_ webResponse: Data?, _ errorString: String?) -> ()) {
        
        // NSURLSession to fetch data from API
        
        completion(nil, "no data yet")
    }
}

class FakeWebClient : Client {
    
    func fetchContent(completion:(_ webResponse: Data?, _ errorString: String?) -> ()) {
        
        let data = readJSONFromFile()
        
        completion(data, nil)
    }
}

func readJSONFromFile() -> Data? {
    
    do {
        if let file = Bundle.main.url(forResource: "Weather", withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [String: Any] {
                // json is a dictionary
                print(object)
            } else if let object = json as? [Any] {
                // json is an array
                print(object)
            } else {
                print("JSON is invalid")
            }
            
            return data
        } else {
            print("no file")
            
            return nil
        }
    } catch {
        print(error.localizedDescription)
    }
    
    return nil
}
