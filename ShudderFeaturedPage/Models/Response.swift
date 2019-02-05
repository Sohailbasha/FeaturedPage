//
//  FeaturedMovies.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/5/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation

struct Response: Codable {
    
    let photos: Photos
    
    enum CodingKeys: String, CodingKey {
        case photos = "photos"
    }
}
