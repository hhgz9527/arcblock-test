//
//  ARCHomeAPI.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import Foundation
import Moya
import SwiftyJSON

class ARCHomeAPI {
    func parse() {
        
    }
    
    func fetchHomeList() {
        let provider = ARCAPI.provider
        provider.request(.fetchHomeList) { (result) in
            switch result {
            case .success(let res):
                let array = ARCParseData.parseArray(data: res.data, methodName: ARCAPI.fetchHomeList.method.rawValue)
            case .failure(let error):
                break
            }
        }
    }
}
