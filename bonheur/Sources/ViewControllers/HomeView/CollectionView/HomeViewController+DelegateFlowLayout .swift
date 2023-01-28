//
//  HomeViewController+DelegateFlowLayout .swift
//  bonheur
//
//  Created by 김소현 on 2023/01/11.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 350
        let cellHeight = 149
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier, for: indexPath) as? HomeCollectionViewHeader else {
            return HomeCollectionViewHeader()
        }
        
        header.configure()
        return header
    }
}
