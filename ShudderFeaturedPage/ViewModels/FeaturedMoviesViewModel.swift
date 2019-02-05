//
//  FeaturedMoviesViewModel.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/5/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation

class FeaturedMoviesViewModel {
    
    private let featuredViewController: FeaturedViewController
    private let baseUrlString = "https://api.flickr.com/services/rest/"
    private let apiKey = "5ebb337b273ad9b825fef4a0ce371b65"
    private let secret = "e49ffa10429c0cd1"
    
    var featuredMovies: Response? {
        didSet {
            print(featuredMovies!)
        }
    }
    
    init(featuredViewController: FeaturedViewController) {
        self.featuredViewController = featuredViewController
    }
    
    func fetchFeaturedMoviesFromMockServer() {
        getMoviesList { (featuredMovies) in
            print(featuredMovies.photos.moviesList)
        }
        // TODO: return an array of arrays
    }
    
    private func getMoviesList(completion: @escaping (_ featuredMovies: Response) -> Void) {
        // TODO: return array
        let parameters = ["format":"json",
                          "api_key":apiKey,
                          "nojsoncallback":"1",
                          "method":"flickr.interestingness.getList",
                          "per_page":"5",
                          "extras":"url_z"]
        
        guard let baseUrl = URL(string: baseUrlString) else { return }
        
        NetworkLogic.performRequest(for: baseUrl, httpMethod: .get, urlParameters: parameters, body: nil) {(data, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
//            guard let featuredMovies = try? self.decoder.decode(Response.self, from: data) else {
//                return
//            }
            
            guard let response = try? self.decoder.decode(Response.self, from: data) else {
                return
            }
            
            
            completion(response)
        }
    }
    
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }

}
