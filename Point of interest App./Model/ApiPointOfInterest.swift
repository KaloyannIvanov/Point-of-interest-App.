//
//  ApiPointOfInterest.swift
//  Point of interest App.
//
//  Created by Kaloyan Ivanov on 13.01.20.
//  Copyright © 2020 Kaloyan Ivanov. All rights reserved.
//

import Foundation

// MARK: - API Model
struct ApiPointOfInterest: Decodable {
    let id: Int
    let title: String
    let leadParagraph: String
    let description: String
    let images: [ApiImages]?
    let latitude: Double
    let longitude: Double
    let radius: Int
    let reviewAverage: Int
    let updatedAt: String
    let createdAt: String
}

struct ApiImages: Decodable {
    let caption: String
    let copyright: String?
    let id: Int
    let imageUrl: URL
    let position: Int
}
