//
//  Persistance.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/15/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation

protocol Persistance {
    
    func last7CachedWeatherDays() -> [Weather]?
    func update(last7Days: [Weather])
}

// in here we'll make 2 implementations, one using simple persistance and one using CoreDataHelper

class UserDefaultsPersistance : Persistance {
    
    func last7CachedWeatherDays() -> [Weather]? {
        
        // do the simple persistance of here using UserDefaults
        return nil
    }
    
    func update(last7Days: [Weather]) {
        
    }
}

class CoreDataPersistance : Persistance {
    
    // because we're only using CoreDataHelper here, the sharedInstance is fine
    let coreDataHelper = CoreDataHelper.sharedInstance
    
    func last7CachedWeatherDays() -> [Weather]? {
        
        // do the proper usage of your Core Data Stack here in this 
        // implementation
        
        return nil
    }
    
    func update(last7Days: [Weather]) {
        
    }
}
