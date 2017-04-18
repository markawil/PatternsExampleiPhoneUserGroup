//
//  DependencyResolver.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/15/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation

class DependencyResolver {
    
    static let sharedResolver = DependencyResolver()
    
    var map = [String:AnyObject]()
    
    func register<T>(instance: T) {
        
        let type = T.self
        let typeString = "\(type)"
        map[typeString] = instance as AnyObject
    }
    
    func resolve<T>() -> T? {
        
        let type = T.self
        let typeString = "\(type)"
        if map.keys.contains(typeString) {
            return map[typeString] as? T
        }
        
        return nil
    }
}
