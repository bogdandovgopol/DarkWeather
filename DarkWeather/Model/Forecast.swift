//
//  Forecast.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 9/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation

struct Forecast {
    var locality: String?
    var latitude: Double?
    var longitude: Double?
    var timezone: String?
    var currently: Currently?
    var daily: [Daily]?
    
    init?(withJson json: [String: Any], andLocality locality: String) {
        guard
            let lat = json["latitude"] as? Double,
            let long = json["longitude"] as? Double else {
            return nil
        }
        
        self.locality = locality
        self.latitude = lat
        self.longitude = long
        
        if let timezone = json["timezone"] as? String {
            self.timezone = timezone
        }
        
        if let currentlyJson = json["currently"] as? [String:Any] {
            self.currently = Currently(withJson: currentlyJson)
        }
        
        if let dailyJson = json["daily"] as? [String:Any]{
            if let dataJson = dailyJson["data"] as? [[String:Any]] {
                var daily = [Daily]()
                for data in dataJson {
                    daily.append(Daily(withJson: data)!)
                }
                self.daily = daily
            }
        }
    }
}
