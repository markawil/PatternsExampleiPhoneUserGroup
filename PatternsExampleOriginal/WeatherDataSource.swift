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
    let webClient: Client
    
    init(persistance: Persistance, client: Client) {
        self.persistance = persistance
        self.webClient = client
    }
    
    func latest10DaysOfWeather(completion:(_ weatherDays:[WeatherDay]?, _ errorString: String?) -> ()) -> [WeatherDay]? {
        
        // use the persistance request the cache, use the client to get back updated async data
        
        return nil
    }
}
