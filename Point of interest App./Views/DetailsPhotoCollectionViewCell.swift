//
//  DetailsPhotoCollectionViewCell.swift
//  Point of interest App.
//
//  Created by Kaloyan Ivanov on 15.01.20.
//  Copyright © 2020 Kaloyan Ivanov. All rights reserved.
//

import UIKit

class DetailsPhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Func-s
    func set(image photo: ApiImages) {
        self.photoImageView.load(url: photo.imageUrl)
    }
}
