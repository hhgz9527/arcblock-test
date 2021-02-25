//
//  UIView+Extension.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/25.
//

import Foundation
import UIKit

extension UIView {
    func cardStyle() {
        self.layer.cornerRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
}
