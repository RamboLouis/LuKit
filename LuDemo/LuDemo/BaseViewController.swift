//
//  BaseViewController.swift
//  LuDemo
//
//  Created by 路政浩 on 2017/3/22.
//  Copyright © 2017年 RamboLu. All rights reserved.
//

import UIKit
import SnapKit

private let baseCellID = "homeCellID"

class BaseViewController: UIViewController {
    
    lazy var baseTableView : UITableView = {
        var baseTableView = UITableView()
        baseTableView.delegate = self
        baseTableView.dataSource = self
        baseTableView.backgroundColor = UIColor.lightGray
        baseTableView.register(UITableViewCell.self, forCellReuseIdentifier: baseCellID)
        return baseTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseTableView)
        baseTableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
extension BaseViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: baseCellID, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  100
    }
    
    
    
}
