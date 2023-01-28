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
}
