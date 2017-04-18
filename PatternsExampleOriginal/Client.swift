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
    
    func fetchContent(completion:@escaping (_ webResponse: Data?, _ errorString: String?) -> ())
}

class WebClient : Client {
    
    let urlPath = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Houston,TX&APPID=9247b098c648be62990fead5689a9dce&units=imperial"
    
    func fetchContent(completion:@escaping (_ webResponse: Data?, _ errorString: String?) -> ()) {
        
        // NSURLSession to fetch data from API
        
        let session = URLSession.shared
        
        if let url = URL(string: urlPath) {
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                completion(data, nil)
                
            })
            
            task.resume()
        }
    }
}

class FakeWebClient : Client {
    
    func fetchContent(completion:@escaping (_ webResponse: Data?, _ errorString: String?) -> ()) {
        
        let data = readJSONFromFile()
        
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            
            completion(data, nil)
        }
        
    }
    
    func readJSONFromFile() -> Data? {
        
        do {
            if let file = Bundle.main.url(forResource: "Weather", withExtension: "json") {
                let data = try NSData(contentsOf: file) as Data
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
                
                return data as Data?
            } else {
                print("no file")
                
                return nil
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}


