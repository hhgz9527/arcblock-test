//
//  ViewController.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import UIKit

protocol ARCHomeDisplayProtocol {
    func fetchHomeListSuccess(timelines: [ARCTimeline])
    func fetchHomeListFailed(error: ARCError)
}

class ARCHomeViewController: UIViewController {
    @IBOutlet weak var homeTableView: UITableView!

    private var timelines: [ARCTimeline]?
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


// MARK: Table View

extension ARCHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelines?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.arcHomeTextCell.identifier, for: indexPath) as! ARCHomeTextCell
        guard let timeline = timelines else { return textCell }
        switch timeline[indexPath.row].type {
        case .text:
            textCell.setup(timeline: timeline[indexPath.row])
            return textCell
        case .img:
            let imgCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.arcHomeImageCell.identifier, for: indexPath) as! ARCHomeImageCell
            imgCell.setup(timeline: timeline[indexPath.row])
            return imgCell
        case .textImg:
            if timeline[indexPath.row].oneImage {
                let oneImgCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.arcHomeOneImageCell.identifier, for: indexPath) as! ARCHomeOneImageCell
                oneImgCell.setup(timeline: timeline[indexPath.row])
                return oneImgCell
            } else {
                let multiImageCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.arcHomeMultiImageCell.identifier, for: indexPath) as! ARCHomeMultiImageCell
                multiImageCell.setup(timeline: timeline[indexPath.row])
                return multiImageCell
            }
        case .textLink:
            textCell.setup(timeline: timeline[indexPath.row])
            return textCell
        default:
            // handle empty case
            return textCell
        }
        
    }
}

// MARK: API

extension ARCHomeViewController: ARCHomeDisplayProtocol {
    func fetchHomeListSuccess(timelines: [ARCTimeline]) {
        self.timelines = timelines
        homeTableView.reloadData()
    }
    
    func fetchHomeListFailed(error: ARCError) {
    
    }
}

