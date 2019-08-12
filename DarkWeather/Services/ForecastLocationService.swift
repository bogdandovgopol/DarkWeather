//
//  ForecastLocationService.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 10/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation
import CoreData

let ForecastLocationService = _ForecastLocationService()


final class _ForecastLocationService {
    //Fetch stored forecast locations in core data
    func fetchLocations(completion: @escaping ([ForecastLocation]?) -> ()) {
        //create context
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        //create fetch request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CORE_DATA_MODELS.FORECAST_LOCATION)
        let sort = NSSortDescriptor(key: #keyPath(ForecastLocation.objectID), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        //fetch data
        do {
            let locations = try managedContext.fetch(fetchRequest) as! [ForecastLocation]
            debugPrint("fetchLocations() - Successfully fetched data")
            completion(locations)
        } catch {
            debugPrint("fetchLocations() - Could not fetch: \(error.localizedDescription)")
            completion(nil)
        }
    }

}
