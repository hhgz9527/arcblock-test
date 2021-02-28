//
//  ARCHomeTextCell.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import UIKit

class ARCHomeTextCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.cardStyle()
    }
    
    func setup(timeline: ARCTimeline) {
        titleLabel.text = timeline.content
        guard let type = timeline.type else { return }
        if type == .textLink {
            contentLabel.text = "🔗查看链接"
        } else {
            contentLabel.text = nil
        }
    }
}
