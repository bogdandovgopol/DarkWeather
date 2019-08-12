//
//  ForecastDetailVC+UICollectionView.swift
//  DarkWeather
//
//  Created by Bogdan Dovgopol on 12/8/19.
//  Copyright © 2019 Bogdan Dovgopol. All rights reserved.
//

import Foundation
import UIKit

extension ForecastDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(dailyForecast.dropFirst(2).count)
        return dailyForecast.dropFirst(2).count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let cellWidth = (width - 10) / 6
        let cellHeight = collectionView.frame.size.height
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        //center CollectionViewCells
        
        let width = collectionView.frame.size.width
        let cellWidth = (width - 10) / 6
        let numberOfCells = floor(collectionView.frame.size.width / cellWidth)
        let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells+1)
        
        return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTIFIERS.FORECAST_CELL, for: indexPath) as? ForecastCell {
            cell.configureCell(withDailyForecast: dailyForecast[indexPath.item+2], andTimezone: forecast.timezone!)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

