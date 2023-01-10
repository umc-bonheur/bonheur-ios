//
//  HomeViewController+FlowLayoutDelegate.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/10.
//

import UIKit

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = 335
        let cellHeight = 149
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
