//
//  WritingViewController+DataSource.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/28.
//

import UIKit

extension WritingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WritingImageCollectionViewCell", for: indexPath) as? WritingImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = imageArray[indexPath.row]
        
        if indexPath.row == self.imageArray.count - 1 {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addButtonDidTapped))
            cell.imageView.addGestureRecognizer(tapGesture)
            cell.imageView.isUserInteractionEnabled = true
        }
        
        return cell
    }
}
