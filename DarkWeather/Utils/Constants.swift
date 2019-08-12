//
//  Constants.swift
//  MovieRoom
//
//  Created by Bogdan Dovgopol on 27/7/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

struct DARKSKY {
    static let BASE_URL = "https://api.darksky.net/forecast/\(DARKSKY.API_KEY)"
}

struct IDENTIFIERS {
    static let LOCATION_CELL = "LocationCell"
    static let FORECAST_CELL = "ForecastCell"
}

struct SEGUAES {
    static let ADD_TO_LOCATION_LIST_VC = "addToLocationListVC"
    static let LOCATION_LIST_TO_FORECAST_DETAIL = "locationListVCToForecastDetailVC"
}

struct CORE_DATA_MODELS {
    static let FORECAST_LOCATION = "ForecastLocation"
}
