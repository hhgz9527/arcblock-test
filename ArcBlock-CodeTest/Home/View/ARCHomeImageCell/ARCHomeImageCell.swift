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
        guard let imgUrls = timeline.imgUrls, let first = imgUrls.first, let url = URL(string: first) else {
            adMobImageView.image = R.image.imgPlaceholder()
            return
        }
        adMobImageView.kf.setImage(with: url, placeholder: R.image.imgPlaceholder())
    }
}
