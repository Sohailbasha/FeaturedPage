//
//  Photos.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/5/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation

// imagine this as MoviesList
struct Photos: Codable {
    
    let moviesList: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case moviesList = "photo"
    }
}


