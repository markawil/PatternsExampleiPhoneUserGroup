//
//  WeatherDataSource.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/14/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation

class WeatherDataSource {
    
    let persistance: Persistance
    let client: Client
    
    init(persistance: Persistance, client: Client) {
        self.persistance = persistance
        self.client = client
    }
    
    func last7DaysOfWeather(completion:@escaping (_ weatherDays:[Weather]?, _ errorString: String?) -> ()) -> [Weather]? {
        
        // use the persistance to request the cache, use the client to get back updated async data
        
        client.fetchContent { (data, errorString) in
            
            if let validData = data {
                if let validWeather = self.extractJSONTypeFromData(validData) as [String:AnyObject]? {
                    if let weatherList = validWeather["list"] as? [[String:AnyObject]] {
                        let weather = Weather.weatherFromResult(weatherList)                      
                        completion(weather, nil)
                    } else {
                        completion(nil, "Something went wrong")
                    }
                } else {
                    completion(nil, "Something went wrong")
                }
            } else {
                completion(nil, "Something went wrong")
            }
        }
        
        return persistance.last7CachedWeatherDays()
    }
    
    fileprivate func extractJSONTypeFromData<T>(_ data: Data) -> T? {
        
        var json: T?
        do {
            json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? T
        }
        catch let error as NSError{
            print("error parsing the json: \(error.localizedDescription)")
        }
        
        return json
    }
}
