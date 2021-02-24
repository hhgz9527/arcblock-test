//
//  ARCLogger.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import Foundation

class ARCLogger {
    static func print<T>(message: T, file: String = #file, method: String = #function, line: Int = #line) {
        debugPrint("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    }
}
