//
//  WritingImageCollectionViewCell.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/28.
//

import UIKit

// TODO: 삭제 버튼 추가
class WritingImageCollectionViewCell: UICollectionViewCell {
    static let id = "WritingImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
