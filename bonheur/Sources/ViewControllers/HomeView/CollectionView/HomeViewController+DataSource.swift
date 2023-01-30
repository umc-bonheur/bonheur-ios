//
//  HomeViewController+DataSource.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/11.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = 350
        let height: CGFloat = 45
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePostingCollectionViewCell.identifier, for: indexPath) as? HomePostingCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.backgroundView = cell.cellBackgroundView
        return cell
    }
}
