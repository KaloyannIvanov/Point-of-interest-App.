//
//  DetailsViewController.swift
//  Point of interest App.
//
//  Created by Kaloyan Ivanov on 14.01.20.
//  Copyright © 2020 Kaloyan Ivanov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var pointOfInterestImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var leadParagraphLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photosLabel: UILabel!
    @IBOutlet weak var ratingStarsStackView: UIStackView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    //MARK: - Constants
    private let reuseIdentifierDetailsPhotoCell = "DetailsPhotoCell"
    private let sectionInsets = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    private let mainTitleImage = 1
    
    //MARK: - Variables
    var pointOfInterestDetails: ApiPointOfInterest!
    
    //MARK: - Func-s
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDetails()
        
        DispatchQueue.main.async {
            self.photoCollectionView.reloadData()
        }
        self.collectionViewDesign()
    }
    
    private func setDetails() {
        self.setPhotos()
        self.titleLabel.text = self.pointOfInterestDetails.title
        self.ratingLabel.text = "(\(self.pointOfInterestDetails.reviewAverage))"
        self.setRatingStars(for: self.pointOfInterestDetails.reviewAverage)
        self.leadParagraphLabel.text = self.pointOfInterestDetails.leadParagraph
        self.descriptionLabel.text = self.pointOfInterestDetails.description
    }
    
    private func setRatingStars(for userRating: Int) {
        for rating in 0..<userRating {
            if let ratingStar = self.ratingStarsStackView.subviews[rating] as? UIImageView {
                ratingStar.image = #imageLiteral(resourceName: "large-filled-star-icon")
            }
        }
    }
    
    private func setPhotos() {
        if let pointOfInterestPhotos = self.pointOfInterestDetails.images {
            self.pointOfInterestImageView.load(url: pointOfInterestPhotos[0].imageUrl)
        }
    }
    
    private func collectionViewDesign() {
        let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = self.sectionInsets
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        self.photoCollectionView.collectionViewLayout = layout
    }
}

// MARK: - UICollectionViewDataSource
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let pointOfInterestPhotos = self.pointOfInterestDetails.images {
            return pointOfInterestPhotos.count - self.mainTitleImage
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifierDetailsPhotoCell, for: indexPath)
        
        if let pointOfInterestPhotos = self.pointOfInterestDetails.images {
            let photo = pointOfInterestPhotos[indexPath.row + self.mainTitleImage]
            
            guard let detailsPhotoCell = cell as? DetailsPhotoCollectionViewCell else {
                fatalError("The dequeued cell is not an instance of DetailsPhotoCollectionViewCell.")
            }
            detailsPhotoCell.set(image: photo)
        }
        return cell
    }
}
