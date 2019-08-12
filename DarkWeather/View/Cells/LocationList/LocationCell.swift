//
//  LocationCell.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 10/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationDegree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionStyle = .none
    }
    
    func configureCell(forecast: Forecast) {
        locationName.text = forecast.locality
        locationDegree.text = "\(Int(forecast.currently?.temperature! ?? 0))°"
    }
    
}
