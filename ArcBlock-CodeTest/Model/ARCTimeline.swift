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
    var imageURLs: [URL]? {
        guard let imgUrls = imgUrls else { return nil }
        let urls = imgUrls.map { URL(string: $0) }
        let cleanData = urls.compactMap { $0 }
        return cleanData
    }
    
    var oneImage: Bool {
        guard let imageURLs = imageURLs else { return false }
        return imageURLs.count == 1
    }
    
    let id: Int?
    let type: ARCTimelineType?
    let content: String?
    let imgUrls: [String]?
    let link: String?
}
