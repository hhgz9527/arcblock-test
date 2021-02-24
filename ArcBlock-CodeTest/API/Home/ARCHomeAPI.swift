//
//  ARCHomeAPI.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import Foundation
import Moya

class ARCHomeAPI {
    static func fetchHomeList() {
        let provider = MoyaProvider<ARCAPI>()
        provider.request(.fetchHomeList) { (result) in
            
        }
    }
}
