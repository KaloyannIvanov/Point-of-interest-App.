//
//  FirstItemCollectionViewCell.swift
//  Point of interest App.
//
//  Created by Kaloyan Ivanov on 14.01.20.
//  Copyright © 2020 Kaloyan Ivanov. All rights reserved.
//

import UIKit

class FirstItemCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Outlets
    @IBOutlet weak var pointOfInterestImageView: UIImageView!
    @IBOutlet weak var pointOfInterestTitleLabel: UILabel!
    @IBOutlet weak var pointOfInterestKmRadiusLabel: UILabel!
    
    //MARK: - Func-s
    func set(title pointOfInterestTitle: String, image pointOfInterestImage: URL? = nil, radius pointOfInterestRadiusKm: Int) {
        self.pointOfInterestImageView.load(url: pointOfInterestImage ?? URL(string: "Test")!)
        self.pointOfInterestTitleLabel.text = pointOfInterestTitle
        self.pointOfInterestKmRadiusLabel.text = "\(pointOfInterestRadiusKm) KM"
    }
}
