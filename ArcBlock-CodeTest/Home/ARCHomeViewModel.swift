//
//  ARCHomeViewModel.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/25.
//

import Foundation

class ARCHomeViewModel {
    
    private let viewController: ARCHomeDisplayProtocol
    
    init(viewController: ARCHomeDisplayProtocol) {
        self.viewController = viewController
    }
    
    func fetchHomeData() {
        ARCHomeAPI.fetchHomeList { [weak self] (result) in
            switch result {
            case .success(let timelins):
                self?.viewController.fetchHomeListSuccess(timelines: timelins)
            case .failure(let error):
                self?.viewController.fetchHomeListFailed(error: error)
            }
        }
    }
}
