//
//  ForecastService.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 10/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation

let DarkSkyService = _DarkSkyService()
var forecasts = [Forecast]()

final class _DarkSkyService {
    let dispatchGroup = DispatchGroup()
    
    func getForecast(locations: [ForecastLocation], completion: @escaping ([Forecast]?, Error?) -> Void) {
        //make sure forecasts array is empty to prevent duplicity in future
        forecasts.removeAll()
        
        //loop through saved locations
        for location in locations {
            dispatchGroup.enter()
            RESTful.request(
                path: "\(DARKSKY.BASE_URL)/\(location.locationLat),\(location.locationLong)",
                method: "GET",
                parameters: ["exclude" : "hourly,flags,offset", "units" : "si"],
                headers: nil) { (data, response, error) in
                    if let error = error {
                        debugPrint("getForecast error: \(error.localizedDescription)")
                        completion(nil, error)
                        return
                    }
                    
                    guard let data = data else {
                        completion(nil, "Did not receive data from API" as! Error)
                        return
                    }
                    
                    do {
                        let rootJSONObject = try JSONSerialization.jsonObject(with: data)
                        
                        guard let rootDictionary = rootJSONObject as? [String:Any] else {
                            completion(nil, "Error in converting JSON to string" as! Error)
                            return
                        }
                        
                        debugPrint("Successfully parsed JSON")
                        let forecast = Forecast(withJson: rootDictionary, andLocality: location.locationName!)
                        
                        forecasts.append(forecast!) //append single forecast object into array
                        self.dispatchGroup.leave()
                        
                    } catch {
                        completion(nil, "Error in converting JSON to string" as! Error)
                    }
            }
            
        }
        dispatchGroup.notify(queue: .main) {
            completion(forecasts, nil)
        }
    }
    
}
