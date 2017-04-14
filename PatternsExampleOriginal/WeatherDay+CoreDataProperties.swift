//
//  WeatherDay+CoreDataProperties.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/14/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation
import CoreData


extension WeatherDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherDay> {
        return NSFetchRequest<WeatherDay>(entityName: "WeatherDay");
    }

    @NSManaged public var dateTime: NSDate?
    @NSManaged public var temperatureHigh: Float
    @NSManaged public var temperatureLow: Float

}
