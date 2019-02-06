//
//  FeaturedViewController.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/4/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    @IBOutlet var categoriesTableView: UITableView!
    var featuredMoviesViewModel: FeaturedMoviesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featuredMoviesViewModel = FeaturedMoviesViewModel(featuredViewController: self)
        featuredMoviesViewModel.fetchFeaturedMoviesFromMockServer(numberOfCategories: 4)

        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.backgroundColor = .blue
    }
}

extension FeaturedViewController: FeaturedMoviesViewModelDelegate {
    
    func didFetchMovies() {
        DispatchQueue.main.async {
            self.categoriesTableView.reloadData()
        }
    }
}

extension FeaturedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featuredMoviesViewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryTableViewCell
        return categoryCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let categoryCell = cell as? CategoryTableViewCell else { return }
        categoryCell.setCollectionViewDatasourceDelegate(datasourceDelegate: self, forRow: indexPath.row)
    }
}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredMoviesViewModel.movies[collectionView.tag].moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCollectionViewCell
        return movieCell ?? UICollectionViewCell()
    }
}
