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
    
    lazy var last7WeatherDays = [Weather]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Houston 7 day Weather"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.refreshControl = UIRefreshControl()
        refreshControl?.beginRefreshing()
        let cachedWeatherDays = weatherDataSource?.last7DaysOfWeather(completion: { (weatherDays, errorString) in
            // set the last10WeatherDays and refresh UITableView
            
            if let validWeatherDays = weatherDays {
                self.last7WeatherDays = validWeatherDays                
                self.tableView.reloadData()
            }
            
            self.refreshControl?.endRefreshing()
        })
        
        if let validWeatherDays = cachedWeatherDays {
            last7WeatherDays = validWeatherDays
            // reload the tableView
            self.tableView.reloadData()
        }
    }    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        if let tempmax = last7WeatherDays[indexPath.row].temp_max {
            cell.textLabel?.text = "\(tempmax)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return last7WeatherDays.count
    }
}

