//
//  ARCHomeCollectionImageCell.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/28.
//

import UIKit

class ARCHomeCollectionImageCell: UICollectionViewCell {
    @IBOutlet weak var contentImageView: UIImageView!
    
    func setup(imageUrl: URL) {
        layer.cornerRadius = 5
        contentImageView.kf.setImage(with: imageUrl, placeholder: R.image.imgPlaceholder())
    }
}
