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
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = 350
        let height: CGFloat = 45
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePostingCollectionViewCell.identifier, for: indexPath) as? HomePostingCollectionViewCell
        else { return UICollectionViewCell() }

//         cell.postingText.text = self.getTotalBoardsResponse.totalGroup[indexPath.row].oneDayGroup[0].contents

        cell.postingImage = 
        cell.backgroundView = cell.cellBackgroundView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let singleDetailViewController = SingleDetailViewController()
        singleDetailViewController.selectedIndex = indexPath.row
//        singleDetailViewController.imageArr = data
        pushView(viewController: singleDetailViewController)
    }
}
