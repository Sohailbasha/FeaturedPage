//
//  CategoryTableViewCell.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/4/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var moviesCollectionView: UICollectionView!
    
    func setCollectionViewDatasourceDelegate(datasourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        moviesCollectionView.dataSource = datasourceDelegate
        moviesCollectionView.delegate = datasourceDelegate
        moviesCollectionView.tag = row
    }
    
    func setCategoryLabel(text: String) {
        categoryLabel.text = text
    }

}
