//
//  ForecastDetailVC.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 11/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import UIKit

class ForecastDetailVC: UIViewController {

    //Outlets
    @IBOutlet weak var forecastLocality: UILabel!
    @IBOutlet weak var todayImg: UIImageView!
    @IBOutlet weak var todayDegree: UILabel!
    @IBOutlet weak var tomorrowImg: UIImageView!
    @IBOutlet weak var tomorrowDegree: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variables
    var forecast: Forecast!
    var currentlyForecast: Currently!
    var dailyForecast: [Daily]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
        updateUI()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: IDENTIFIERS.FORECAST_CELL, bundle: nil), forCellWithReuseIdentifier: IDENTIFIERS.FORECAST_CELL)
    }
    

    func updateUI() {
        
        //make sure current forecast exists
        guard let currently = forecast.currently else {
            return
        }
        currentlyForecast = currently
        
        //update current forecast ui
        forecastLocality.text = forecast.locality
        todayImg.image = UIImage(named: currentlyForecast.icon!)
        todayDegree.text = "\(Int(currentlyForecast.temperature!.rounded()))°"
        
        //make sure forecast for the next day exists
        guard let daily = forecast.daily else {
            return
        }
        dailyForecast = daily
        
        //update tomorrow forecast ui
        tomorrowImg.image = UIImage(named: dailyForecast[1].icon!)
        tomorrowDegree.text = "\(Int(dailyForecast[1].temperatureHigh!.rounded()))°"
    }

}


