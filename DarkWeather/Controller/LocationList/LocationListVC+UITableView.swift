//
//  LocationListVC+UITableView.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 12/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation
import UIKit

extension LocationListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastLocations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIERS.LOCATION_CELL, for: indexPath) as? LocationCell {
            cell.configureCell(forecast: forecasts[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedForecast = forecasts[indexPath.row]
        performSegue(withIdentifier: SEGUAES.LOCATION_LIST_TO_FORECAST_DETAIL, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUAES.LOCATION_LIST_TO_FORECAST_DETAIL {
            if let destination = segue.destination as? ForecastDetailVC {
                destination.forecast = selectedForecast
            }
        }
    }
    
    //SWIPE TO DELETE
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.deleteLocation(atIndexPath: indexPath)
            self.fetchLocationList()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9943010211, green: 0.3163655102, blue: 0.3532691002, alpha: 1)
        return [deleteAction]
    }
    
    func deleteLocation(atIndexPath indexPath: IndexPath) {
        //create context
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(forecastLocations[indexPath.row])
        self.forecastLocations.remove(at: indexPath.row)
        
        do {
            try? managedContext.save()
            debugPrint("Successfully remove location")
        } catch {
            debugPrint("Could not remove location: \(error.localizedDescription)")
        }
    }
}
