//
//  WritingViewController+DataSource.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/28.
//

import UIKit

extension WritingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WritingImageCollectionViewCell", for: indexPath) as? WritingImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = images[indexPath.row]
        
        cell.closeButton.tag = indexPath.row
        cell.closeButton.addTarget(self, action: #selector(closeButtonTapped(sender:)), for: .touchUpInside)
        
        // 사진 추가 버튼에만 액션 부여 및 X 버튼 삭제
        if indexPath.row == images.count - 1 {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addButtonDidTapped))
            cell.imageView.addGestureRecognizer(tapGesture)
            cell.imageView.isUserInteractionEnabled = true
            
            cell.closeButton.isHidden = true
            cell.closeButton.isEnabled = false
            
        } else {
            cell.imageView.isUserInteractionEnabled = false
            
            cell.closeButton.isHidden = false
            cell.closeButton.isEnabled = true
        }
        
        var countImage = self.imageCollectionView.numberOfItems(inSection: 0)
        
        // TODO: 5번째 cell까지만 스크롤되도록 하는 방법 찾기
        if countImage == self.maxImageNumber + 1 && indexPath.row == self.maxImageNumber {
            cell.imageView.isHidden = true
        } else {
            cell.imageView.isHidden = false
        }
            
        return cell
    }
    
    // TODO: Performing reloadData as a fallback — Invalid update: invalid number of items in section 0.
    @objc func closeButtonTapped(sender: UIButton) {
        self.imageCollectionView.deleteItems(at: [IndexPath.init(row: sender.tag, section: 0)])
        self.images.remove(at: sender.tag)
        self.imageCollectionView.reloadData()
    }
}
