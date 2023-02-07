//
//  TagLabel.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import UIKit

class TagLabel: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
    }
}
