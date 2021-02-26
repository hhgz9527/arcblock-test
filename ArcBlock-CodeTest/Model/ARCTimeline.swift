//
//  ARCTimeline.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import Foundation

enum ARCTimelineType: String, Codable {
    case text
    case img
    case textImg = "text-img"
    case textLink = "text-link"
}

class ARCTimeline: Codable {
    var oneImage: Bool {
        guard let imgUrls = imgUrls else { return false }
        return imgUrls.count == 1
    }
    
    let id: Int?
    let type: ARCTimelineType?
    let content: String?
    let imgUrls: [String]?
    let link: String?
}
