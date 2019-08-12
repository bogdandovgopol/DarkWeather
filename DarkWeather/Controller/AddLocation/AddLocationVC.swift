//
//  ViewController.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 9/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import UIKit
import CoreLocation

class AddLocationVC: UIViewController {

    //Outlets
    @IBOutlet weak var addressTxt: UITextField!
    
    //Variables
    let geoCoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2666666667, alpha: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.8173398972, green: 0.8310464025, blue: 0.8440452218, alpha: 1)
    }
    
    @IBAction func addLocationClicked(_ sender: Any) {
        guard let address = addressTxt.text, !address.isEmpty else {
            return
        }
        
        getAndSaveCoordinates { (complete) in
            if complete {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func getAndSaveCoordinates(completion: @escaping (_ complete: Bool) -> ()) {
        //get lat/long coordinates from typed address
        geoCoder.geocodeAddressString(addressTxt.text!) { (placemarks, error) in
            guard
                let placemark = placemarks?.first,
                let locality = placemark.locality,
                let coordinate = placemark.location?.coordinate else {
                    print("Not found")
                    return
            }
                        
            //create context
            guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
            
            //create new forecast location
            let forecastLocation = ForecastLocation(context: managedContext)
            forecastLocation.locationName = locality
            forecastLocation.locationLat = coordinate.latitude
            forecastLocation.locationLong = coordinate.longitude
            
            //save data
            do {
                try managedContext.save()
                completion(true)
            } catch {
                debugPrint("Could not save: \(error)")
                completion(false)
            }
            
        }
    }
    
}

