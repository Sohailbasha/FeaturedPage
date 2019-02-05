//
//  Movie.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/5/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let urlZ: String
    
    private enum CodingKeys: String, CodingKey {
        case urlZ = "url_z"
    }
}
