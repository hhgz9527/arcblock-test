//
//  ARCTimelineSpec.swift
//  ArcBlock-CodeTestTests
//
//  Created by 高宇 on 2021/2/28.
//

import Foundation
@testable import ArcBlock_CodeTest
import Quick
import Nimble


class ARCTimelineSpec: QuickSpec {
    override func spec() {
        describe("type") {
            context("when type is text") {
                it("return text") {
                    let model = ARCTimelineBuilder().addTextStyle().builder()
                    expect(model.type!).to(equal(.text))
                }
            }
            
            context("when type is img") {
                it("return img") {
                    let model = ARCTimelineBuilder().addImageStyle().builder()
                    expect(model.type!).to(equal(.img))
                }
            }
            
            context("when type is text-img") {
                it("return textImage") {
                    let model = ARCTimelineBuilder().addTextImageStyle(imageCount: 1).builder()
                    expect(model.type!).to(equal(.textImg))
                }
            }
            
            context("when type is text-link") {
                it("return textLink") {
                    let model = ARCTimelineBuilder().addTextLinkStyle().builder()
                    expect(model.type!).to(equal(.textLink))
                }
            }
        }
        
        describe("oneImage") {
            context("when type is text-img, imageUrls count is 1") {
                it ("return true") {
                    let model = ARCTimelineBuilder().addTextImageStyle(imageCount: 1).builder()
                    expect(model.oneImage).to(beTrue())
                }
            }
            
            context("when type isn't text-img") {
                it ("return false") {
                    let model = ARCTimelineBuilder().addImageStyle().builder()
                    expect(model.oneImage).to(beFalse())
                    
                    let model1 = ARCTimelineBuilder().addTextStyle().builder()
                    expect(model1.oneImage).to(beFalse())
                    
                    let model2 = ARCTimelineBuilder().addTextLinkStyle().builder()
                    expect(model2.oneImage).to(beFalse())
                }
            }
            
            context("when type is text-img, imageUrls count great than 1") {
                it ("return false") {
                    let model = ARCTimelineBuilder().addTextImageStyle(imageCount: 2).builder()
                    expect(model.oneImage).to(beFalse())
                    
                    let model1 = ARCTimelineBuilder().addTextImageStyle(imageCount: 22).builder()
                    expect(model1.oneImage).to(beFalse())
                }
            }
            
            context("when type is text-img, imageUrls count is 0") {
                it ("return false") {
                    let model = ARCTimelineBuilder().addTextImageStyle(imageCount: 0).builder()
                    expect(model.oneImage).to(beTrue())
                }
            }
        }
    }
}
