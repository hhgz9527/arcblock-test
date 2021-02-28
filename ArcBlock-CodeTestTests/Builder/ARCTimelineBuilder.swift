//
//  ARCTimelineBuilder.swift
//  ArcBlock-CodeTestTests
//
//  Created by 高宇 on 2021/2/28.
//

import Foundation
@testable import ArcBlock_CodeTest

class ARCTimelineBuilder {
    private var json: String
    
    init() {
        json = ""
    }
    
    func addTextStyle() -> ARCTimelineBuilder {
        json = """
            {"id":1,"type":"text","content":"首先，感谢您抽出宝贵的时间进行 Coding Test, 这个 Coding Test 的目标是实现一个多类型的列表页以及对应的详情页面，您可以自由发挥实现整体效果，我们将根据您的最终作品做一个评估考核。"}
            """
        return self
    }
    
    func addImageStyle() -> ARCTimelineBuilder {
        json = """
            {"id":1,"type":"img","content":"首先，感谢您抽出宝贵的时间进行 Coding Test, 这个 Coding Test 的目标是实现一个多类型的列表页以及对应的详情页面，您可以自由发挥实现整体效果，我们将根据您的最终作品做一个评估考核。"}
            """
        return self
    }
    
    func addTextImageStyle(imageCount: Int) -> ARCTimelineBuilder {
        json = json + """
            {"id":1,"type":"text-img","content":"首先，感谢您抽出宝贵的时间进行 Coding Test, 这个 Coding Test 的目标是实现一个多类型的列表页以及对应的详情页面，您可以自由发挥实现整体效果，我们将根据您的最终作品做一个评估考核。"
            """
        
        if imageCount == 1 {
            json = json + ", \"imgUrls\": [\"1\"]}"
        } else if imageCount == 0 {
            json = json + "}"
        } else {
            json = json + ", \"imgUrls\": "
            for index in 0..<imageCount {
                if index == 0 {
                    json = json + "[\"1\","
                } else if index == imageCount - 1 {
                    json = json + "\"1\"]}"
                } else {
                    json = json + "\"1\","
                }
            }
        }
        return self
    }
    
    func addTextLinkStyle() -> ARCTimelineBuilder {
        json = """
            {"id":1,"type":"text-link","content":"首先，感谢您抽出宝贵的时间进行 Coding Test, 这个 Coding Test 的目标是实现一个多类型的列表页以及对应的详情页面，您可以自由发挥实现整体效果，我们将根据您的最终作品做一个评估考核。"}
            """
        return self
    }
    
    func builder() -> ARCTimeline {
        return try! JSONDecoder().decode(ARCTimeline.self, from: json.utf8Encoded)
    }
}
