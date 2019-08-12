//
//  LocationListVC.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 10/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import UIKit
import CoreData

class LocationListVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var forecastLocations: [ForecastLocation] = []
    var forecasts: [Forecast] = []
    var selectedForecast: Forecast!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //hide navigationBar bottom border/line
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchLocationList()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: IDENTIFIERS.LOCATION_CELL, bundle: nil), forCellReuseIdentifier: IDENTIFIERS.LOCATION_CELL)
    }
    
    func fetchLocationList() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        ForecastLocationService.fetchLocations { (locations) in
            guard let locations = locations else {
                debugPrint("No locations fetched returned")
                return
            }
            
            DarkSkyService.getForecast(locations: locations) { (forecasts, error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                    return
                }
                guard let forecasts = forecasts else {
                    debugPrint("no forecasts")
                    return;
                }
                
                self.forecasts = forecasts
                self.forecastLocations = locations
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
            
        }
    }
}
