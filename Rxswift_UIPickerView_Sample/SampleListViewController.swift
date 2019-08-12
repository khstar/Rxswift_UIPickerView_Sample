//
//  SampleListViewController.swift
//  Rxswift_UIPickerView_Sample
//
//  Created by khstar on 14/06/2019.
//  Copyright © 2019 khstar. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import PureLayout

class SampleListViewController:UIViewController {
    
    
    lazy var sampleListViewCtrl: UITableView! = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
//        let tableView = UITableView(frame: CGRect.zero, collectionViewLayout: layout)
        
//        let style = UITableView.Style(rawValue: type.grouped)
        
        let style = UITableView.Style(rawValue: 0)
        let tableView = UITableView(frame: CGRect.zero, style: style!)
        
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() { }
    
    /**
     View Setting
     */
    func setView() {
        self.view.addSubview(sampleListViewCtrl)
        sampleListViewCtrl.autoPinEdgesToSuperviewMargins()
    }
    
}

extension SampleListViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
