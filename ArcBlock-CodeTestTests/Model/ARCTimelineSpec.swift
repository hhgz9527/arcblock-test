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
                    let model = ARCTimelineBuilder().addTextImageStyle().builder()
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
    }
}
