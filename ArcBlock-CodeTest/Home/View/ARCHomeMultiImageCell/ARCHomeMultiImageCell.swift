//
//  ARCHomeMultiImageCell.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/25.
//

import UIKit

class ARCHomeMultiImageCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    private var timeline: ARCTimeline?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        bgView.cardStyle()
    }
    
    func setup(timeline: ARCTimeline) {
        titleLabel.text = timeline.content
        self.timeline = timeline
    }
}

extension ARCHomeMultiImageCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeline?.imageURLs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.arcHomeCollectionImageCell.identifier, for: indexPath) as! ARCHomeCollectionImageCell
        guard let timeline = timeline, let imageURLs = timeline.imageURLs else { return cell }
        cell.setup(imageUrl: imageURLs[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 96)
    }
}
