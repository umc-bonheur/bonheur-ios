//
//  HomePostingCollectionView.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/09.
//

import UIKit

public let homePostingCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(HomePostingCollectionViewCell.self, forCellWithReuseIdentifier: HomePostingCollectionViewCell.identifier)
    
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .clear
    
    return collectionView
}()
