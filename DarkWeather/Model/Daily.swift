//
//  Daily.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 10/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation

struct Daily {
    var time: Int?
    var summary: String?
    var icon: String?
    var sunriseTime: Int?
    var sunsetTime: Int?
    var moonPhase: Double?
    var precipIntensity: Double?
    var precipIntensityMax: Double?
    var precipIntensityMaxTime: Int?
    var precipProbability: Double?
    var precipType: String?
    var temperatureHigh: Double?
    var temperatureHighTime: Int?
    var temperatureLow: Double?
    var temperatureLowTime: Int?
    var dewPoint: Double?
    var humidity: Double?
    var pressure: Double?
    var windSpeed: Double?
    var windGust: Double?
    var windGustTime: Int?
    var windBearing: Int?
    var cloudCover: Double?
    var uvIndex: Int?
    var uvIndexTime: Int?
    var visibility: Double?
    var ozone: Double?
    
    init?(withJson data: [String:Any]) {
        
        if let time = data["time"] as? Int {
            self.time = time
        }
        if let summary = data["summary"] as? String {
            self.summary = summary
        }
        if let icon = data["icon"] as? String {
            self.icon = icon
        }
        if let sunriseTime = data["sunriseTime"] as? Int {
            self.sunriseTime = sunriseTime
        }
        if let sunsetTime = data["sunsetTime"] as? Int {
            self.sunsetTime = sunsetTime
        }
        if let precipIntensity = data["precipIntensity"] as? Double {
            self.precipIntensity = precipIntensity
        }
        if let precipIntensityMax = data["precipIntensityMax"] as? Double {
            self.precipIntensityMax = precipIntensityMax
        }
        if let precipIntensityMaxTime = data["precipIntensityMaxTime"] as? Int {
            self.precipIntensityMaxTime = precipIntensityMaxTime
        }
        if let precipProbability = data["precipProbability"] as? Double {
            self.precipProbability = precipProbability
        }
        if let precipType = data["precipType"] as? String {
            self.precipType = precipType
        }
        if let temperatureHigh = data["temperatureHigh"] as? Double {
            self.temperatureHigh = temperatureHigh
        }
        if let temperatureHighTime = data["temperatureHighTime"] as? Int {
            self.temperatureHighTime = temperatureHighTime
        }
        if let temperatureLow = data["temperatureLow"] as? Double {
            self.temperatureLow = temperatureLow
        }
        if let temperatureLowTime = data["temperatureLowTime"] as? Int {
            self.temperatureLowTime = temperatureLowTime
        }
        if let dewPoint = data["dewPoint"] as? Double {
            self.dewPoint = dewPoint
        }
        if let humidity = data["humidity"] as? Double {
            self.humidity = humidity
        }
        if let pressure = data["pressure"] as? Double {
            self.pressure = pressure
        }
        if let windSpeed = data["windSpeed"] as? Double {
            self.windSpeed = windSpeed
        }
        if let windGust = data["windGust"] as? Double {
            self.windGust = windGust
        }
        if let windBearing = data["windBearing"] as? Int {
            self.windBearing = windBearing
        }
        if let cloudCover = data["cloudCover"] as? Double {
            self.cloudCover = cloudCover
        }
        if let uvIndex = data["uvIndex"] as? Int {
            self.uvIndex = uvIndex
        }
        if let uvIndexTime = data["uvIndexTime"] as? Int {
            self.uvIndexTime = uvIndexTime
        }
        if let visibility = data["visibility"] as? Double {
            self.visibility = visibility
        }
        if let ozone = data["ozone"] as? Double {
            self.ozone = ozone
        }
    }
}
