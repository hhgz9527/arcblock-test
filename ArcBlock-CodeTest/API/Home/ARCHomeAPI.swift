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
    static func fetchHomeList(closure: @escaping (Result<[ARCTimeline], ARCError>) -> Void) {
        let provider = ARCAPI.provider
        provider.request(.fetchHomeList) { (result) in
            switch result {
            case .success(let res):
                let array = ARCParseData.parseArray(data: res.data, methodName: ARCAPI.fetchHomeList.path, model: ARCTimeline.self)
                closure(.success(array ?? []))
            case .failure(let error):
                ARCLogger.print(message: error.errorDescription)
                closure(.failure(.badRequest))
            }
        }
    }
}
