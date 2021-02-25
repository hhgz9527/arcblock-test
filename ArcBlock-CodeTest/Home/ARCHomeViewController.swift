//
//  ViewController.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import UIKit

protocol ARCHomeDisplayProtocol: class {
    func fetchHomeListSuccess(timelines: [ARCTimeline])
    func fetchHomeListFailed(error: ARCError)
}

class ARCHomeViewController: UIViewController {
    private var timelinse: [ARCTimeline]?
    private var viewModel: ARCHomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = R.string.arcString.home()
        setup()
        fetchData()
    }
    
    private func setup() {
        viewModel = ARCHomeViewModel(viewController: self)
    }
    
    private func fetchData() {
        viewModel.fetchHomeData()
    }
}

extension ARCHomeViewController: ARCHomeDisplayProtocol {
    func fetchHomeListSuccess(timelines: [ARCTimeline]) {
        timelinse = timelines
    }
    
    func fetchHomeListFailed(error: ARCError) {
    
    }
}

