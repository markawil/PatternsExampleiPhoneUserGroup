//
//  WeatherDataSource.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/14/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation

struct WeatherDataSource {
    
    /// lets NOT use a singleton
    
    let coreDataHelper = CoreDataHelper.sharedInstance
    
    func latest10DaysOfWeather() -> [WeatherDay]? {
        
        // use the CDH to make a fetch request on the cache, see what it returns
        
        return nil
    }
}
