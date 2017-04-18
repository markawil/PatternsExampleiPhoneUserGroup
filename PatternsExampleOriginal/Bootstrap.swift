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
        
        DependencyResolver.sharedResolver.register(instance: FakeWebClient() as Client)
        DependencyResolver.sharedResolver.register(instance: UserDefaultsPersistance() as Persistance)
    }
    
    func registerReals() {
        
        DependencyResolver.sharedResolver.register(instance: WebClient() as Client)
        DependencyResolver.sharedResolver.register(instance: CoreDataPersistance() as Persistance)
    }
}
