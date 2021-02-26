//
//  ARCHomeImageCell.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/25.
//

import UIKit
import Kingfisher

class ARCHomeImageCell: UITableViewCell {
    @IBOutlet weak var adMobImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.cardStyle()
        adMobImageView.layer.cornerRadius = 5
    }

    func setup(timeline: ARCTimeline) {
        adMobImageView.kf.setImage(with: timeline.imageURLs?.first, placeholder: R.image.imgPlaceholder())
    }
}
