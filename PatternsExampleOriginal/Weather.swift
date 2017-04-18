//
//  Weather.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/18/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import Foundation
import UIKit

struct Weather {
    
    //MARk: Properties
    
    //main keys
    let temp: Double?
    let humidity: Int?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Double?
    let rain: Double?
    let clouds: Int?
    let speed: Double?
    let dateTIme: Double?
    
    //weather keys
    let main: String?
    let icon: String?
    let weaDescription: String?
    
    init(dictionary: [String:AnyObject]){
        
        humidity = dictionary[JSONResponseKeys.humidity] as? Int
        pressure = dictionary[JSONResponseKeys.pressure] as? Double
        rain = dictionary[JSONResponseKeys.rain] as? Double
        speed = dictionary[JSONResponseKeys.windSpeed] as? Double
        clouds = dictionary[JSONResponseKeys.cloud] as? Int
        dateTIme = dictionary[JSONResponseKeys.dt] as? Double
        
        if let main = dictionary[JSONResponseKeys.temp] as? [String:AnyObject]{
            temp = main[JSONResponseKeys.currentTemp] as? Double
            temp_max = main[JSONResponseKeys.temp_max] as? Double
            temp_min = main[JSONResponseKeys.temp_min] as? Double
        }else{
            temp = 0.0
            temp_max = 0.0
            temp_min = 0.0
        }
        
        if let weather = dictionary[JSONResponseKeys.weather] as? [[String:AnyObject]]{
            main = weather[0][JSONResponseKeys.mainWeather] as? String
            icon = weather[0][JSONResponseKeys.icon] as? String
            weaDescription = weather[0][JSONResponseKeys.weatherDescription] as? String
        }else{
            main = ""
            icon = ""
            weaDescription = ""
        }
        
    }
    
    //MARK: helper methods
    static func weatherFromResult(_ results: [[String:AnyObject]]) -> [Weather]{
        
        var weathers = [Weather]()
        
        for result in results{
            weathers.append(Weather(dictionary: result))
        }
        
        return weathers
    }
    
    //conver temp from kelvin to fah
    static func fFrom(kelvin value: Double) -> Int?{
        return Int((1.8 * (value - 273) + 32).rounded())
    }
    
    //unix time conversion
    static func unixTimeConvertion(unixTime: Double, format: String) -> String {
        let time = NSDate(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "America/Chicago") as TimeZone!
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.system.identifier) as Locale!
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: time as Date)
    }
    
}

extension Weather {
    
    //MARK: Constants
    struct Constants{
        
        //MARK: API Key for OpenWeatherMap
        static let ApiKey = "9247b098c648be62990fead5689a9dce"
        
        //MARK: URLs
        static let ApiScheme = "http"
        static let ApiHost = "api.openweathermap.org"
        static let ApiPath = "/data/2.5/"
        static let Units = "imperial"
        
        //MARK: icon url
        
        static let baseImageURLString = "http://openweathermap.org/img/w/"
    }
    
    struct Colors{
        static let pinkColor = UIColor(red:0.98, green:0.39, blue:0.49, alpha:1.00)
        static let blueColor = UIColor(red:0.54, green:0.76, blue:0.81, alpha:1.00)
    }
    
    //MARK: Methods
    struct Methods {
        
        //MARK: current weather
        static let currentWeather = "weather"
        static let forcastDaily = "forecast/daily"
    }
    
    //MARK: parameter keys
    struct ParameterKeys {
        static let ApiKey = "APPID"
        static let Query = "q"
        static let Units = "units"
    }
    
    //MARK: JSON Response keys
    struct JSONResponseKeys {
        
        //MARK: General & sys
        static let StatusCode = "cod"
        static let name = "name"
        static let country = "country"
        static let sys = "sys"
        static let sunrise = "sunrise"
        static let sunset = "sunset"
        static let dt = "dt"
        
        //MARK: Current weather
        static let weather = "weather"
        static let mainWeather = "main"
        static let weatherDescription = "description"
        static let icon = "icon"
        
        //MARK: temp keys
        static let main = "main"
        static let temp = "temp"
        static let currentTemp = "day"
        static let humidity = "humidity"
        static let temp_max = "max"
        static let temp_min = "min"
        static let pressure = "pressure"
        
        //MARK: wind keys
        static let wind = "wind"
        static let windSpeed = "speed"
        static let windDireccion = "deg"
        static let rain = "rain"
        static let cloud = "clouds"
        
        //MARK: weather list
        static let list = "list"
        
    }
}
