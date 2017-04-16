//
//  Bootstrap.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/16/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation

class Bootstrap {
    
    func registerFakes() {
        
        DependencyResolver.sharedResolver.register(type: Client.self, instance: FakeWebClient())
        DependencyResolver.sharedResolver.register(type: Persistance.self, instance: UserDefaultsPersistance())
    }
    
    func registerReals() {
        
        DependencyResolver.sharedResolver.register(type: Client.self, instance: WebClient())
        DependencyResolver.sharedResolver.register(type: Persistance.self, instance: CoreDataPersistance())
    }
}
