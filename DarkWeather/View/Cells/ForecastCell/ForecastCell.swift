//
//  ForecastCell.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 12/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import UIKit

class ForecastCell: UICollectionViewCell {

    //Outlets
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var degree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(withDailyForecast forecast: Daily, andTimezone timezone: String) {
        time.text = timestampToShortDayOfWeek(withTimestamp: forecast.time!, andTimezone: timezone)
        degree.text = "\(Int((forecast.temperatureHigh!.rounded())))°"
    }

    //convert timestamp & timezone to time in format: Mon
    func timestampToShortDayOfWeek(withTimestamp timestamp: Int, andTimezone timezone: String) -> String{
        let date = Date(timeIntervalSince1970: Double(timestamp))
        let dateFormatter = DateFormatter()
        //        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        //        dateFormatter.locale = NSLocale.current
        dateFormatter.timeZone = TimeZone(identifier: timezone)
        dateFormatter.dateFormat = "EEE"
        
        return dateFormatter.string(from: date)
    }
}
