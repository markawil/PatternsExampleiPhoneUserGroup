//
//  ViewController.swift
//  PatternsExampleOriginal
//
//  Created by Mark Wilkinson on 4/9/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // now VC has no idea where it's getting the data from, doesn't care
    var weatherDataSource: WeatherDataSource?
    
    lazy var last10WeatherDays = [WeatherDay]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let cachedWeatherDays = weatherDataSource?.latest10DaysOfWeather(completion: { (weatherDays, errorString) in
            // set the last10WeatherDays and refresh UITableView
        })
        
        if let validWeatherDays = cachedWeatherDays {
            last10WeatherDays = validWeatherDays
            // reload the tableView
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func extractJSONTypeFromData<T>(_ data: Data) -> T? {
        
        var json: T?
        do {
            json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? T  }
        catch let error as NSError{
            print("error parsing the json: \(error.localizedDescription)")
        }
        
        return json
    }
}

