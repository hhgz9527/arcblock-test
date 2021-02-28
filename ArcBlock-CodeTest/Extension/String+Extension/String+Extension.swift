//
//  String+Extension.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/28.
//

import Foundation
import UIKit

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
