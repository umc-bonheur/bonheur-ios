//
//  WritingImageCollectionViewCell.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/28.
//

import UIKit

class WritingImageCollectionViewCell: UICollectionViewCell {
    static let id = "WritingImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(closeButton)
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
    
    lazy var closeButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "Close")
        config.baseBackgroundColor = .clear
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return UIButton(configuration: config)
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 7.7),
            closeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10.7)
        ])
    }
    
}
