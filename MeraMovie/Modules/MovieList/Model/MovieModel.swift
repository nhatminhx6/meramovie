//
//  MovieModel.swift
//  MeraMovie
//
//  Created by NhatMinh on 29/08/2023.
//

import Foundation
import UIKit

struct MovieModel {
    let id: Int
    let title: String
    let description: String
    let rating: Float
    let duration: String // In real case it will be Double value
    let genre: String
    let releasedDate: String // In real case it will be Double value
    let trailerUrl: String
    let thumbnail: UIImage // In real case it will be String value
    let fakeTimeStamp: Double
    
    func getReleaseYear() -> Int {
        let date = self.releasedDate
        let arr = date.split(separator: " ")
        var year: String = ""
        if arr.count > 2 {
            year = String(arr[2])
        }
        return Int(year) ?? 0

    }
}

