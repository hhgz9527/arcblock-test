//
//  ARCParseData.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import Foundation
import SwiftyJSON

enum ARCAPICode: Int {
    case success
    case failed
}

class ARCParseData {
    static func parseArray<Model: Codable>(data: Data, methodName: String, model: Model.Type) -> [Model]? {
        let code = JSON(data).dictionaryValue["code"]?.intValue
        switch ARCAPICode(rawValue: code ?? 999999) {
        case .success:
            do {
                guard let json = JSON(data).dictionaryValue["data"] else { return nil }
                let array = json.arrayValue
                return try array.map { try JSONDecoder().decode(model.self, from: $0.rawData()) }
            } catch {
                ARCLogger.print(message: "\(methodName) - parse data failed")
                return nil
            }
        case .failed:
            ARCLogger.print(message: "\(methodName) - api request failed")
            return nil
        case .none:
            ARCLogger.print(message: "\(methodName) - new code")
            return nil
        }
    }
}
