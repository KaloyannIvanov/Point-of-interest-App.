//
//  Networking.swift
//  Point of interest App.
//
//  Created by Kaloyan Ivanov on 13.01.20.
//  Copyright © 2020 Kaloyan Ivanov. All rights reserved.
//

import Foundation


enum PointOfInterestError: Error {
    case noDataAvailable
    case canNotProcessData
}

//MARK: - Networking
final class Networking {
    
    //MARK: - Singleton
    static let shared = Networking()
    
    //    private init() {}
    //MARK: - Func-s
    func getPointOfInterest(completion: @escaping(Result<[ApiPointOfInterest], PointOfInterestError>) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host   = "5e16e7d422b5c600140d0126.mockapi.io"
        components.path   = "/pois"
        
        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
                
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let apiPointOfInterestResponse = try decoder.decode([ApiPointOfInterest].self, from: jsonData)
                    completion(.success(apiPointOfInterestResponse))
                } catch {
                    completion(.failure(.canNotProcessData))
                    print("error: \(error)")
                }
            }
        }
        task.resume()
    }
}
