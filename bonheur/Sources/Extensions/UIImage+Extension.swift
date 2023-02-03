//
//  UIImage+Extension.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit

extension UIImage {

    convenience init?(assetName: String) {
        self.init(named: assetName, in: Bundle.main, with: nil)
    }

    /// 이미지 리사이징하는 함수
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}
