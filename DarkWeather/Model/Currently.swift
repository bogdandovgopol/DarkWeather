//
//  Currently.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 10/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation

struct Currently {
    var time: Int?
    var summary: String?
    var icon: String?
    var precipIntensity: Double?
    var precipProbability: Double?
    var precipType: String?
    var temperature: Double?
    var apparentTemperature: Double?
    var dewPoint: Double?
    var humidity: Double?
    var pressure: Double?
    var windSpeed: Double?
    var windGust: Double?
    var windBearing: Int?
    var cloudCover: Double?
    var uvIndex: Int?
    var visibility: Double?
    var ozone: Double?
    
    init?(withJson json: [String:Any]) {
        if let time = json["time"] as? Int {
            self.time = time
        }
        if let summary = json["summary"] as? String {
            self.summary = summary
        }
        if let icon = json["icon"] as? String {
            self.icon = icon
        }
        if let precipIntensity = json["precipIntensity"] as? Double {
            self.precipIntensity = precipIntensity
        }
        if let precipProbability = json["precipProbability"] as? Double {
            self.precipProbability = precipProbability
        }
        if let precipType = json["precipType"] as? String {
            self.precipType = precipType
        }
        if let temperature = json["temperature"] as? Double {
            self.temperature = temperature
        }
        if let apparentTemperature = json["apparentTemperature"] as? Double {
            self.apparentTemperature = apparentTemperature
        }
        if let dewPoint = json["dewPoint"] as? Double {
            self.dewPoint = dewPoint
        }
        if let humidity = json["humidity"] as? Double {
            self.humidity = humidity
        }
        if let pressure = json["pressure"] as? Double {
            self.pressure = pressure
        }
        if let windSpeed = json["windSpeed"] as? Double {
            self.windSpeed = windSpeed
        }
        if let windGust = json["windGust"] as? Double {
            self.windGust = windGust
        }
        if let windBearing = json["windBearing"] as? Int {
            self.windBearing = windBearing
        }
        if let cloudCover = json["cloudCover"] as? Double {
            self.cloudCover = cloudCover
        }
        if let uvIndex = json["uvIndex"] as? Int {
            self.uvIndex = uvIndex
        }
        if let visibility = json["visibility"] as? Double {
            self.visibility = visibility
        }
        if let ozone = json["ozone"] as? Double {
            self.ozone = ozone
        }
    }
}
