//
//  HomeViewController+DataSource.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/10.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePostingCollectionViewCell.identifier, for: indexPath) as? HomePostingCollectionViewCell
            else { return UICollectionViewCell() }
        
        return cell
    }
}
