//
//  ARCHomeOneImageCell.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/25.
//

import UIKit

class ARCHomeOneImageCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.cardStyle()
        contentImageView.layer.cornerRadius = 5
    }

    func setup(timeline: ARCTimeline) {
        titleLabel.text = timeline.content
        contentImageView.kf.setImage(with: timeline.imageURLs?.first, placeholder: R.image.imgPlaceholder())
    }
}
