//
//  ViewController.swift
//  LuDemo
//
//  Created by 路政浩 on 2017/3/22.
//  Copyright © 2017年 RamboLu. All rights reserved.
//

import UIKit

private let homeCellID = "homeCellID"

class ViewController: BaseViewController{

    var textArr = ["弹框控件","测试1","测试2","测试3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "测试"
        baseTableView.register(UITableViewCell.self, forCellReuseIdentifier: homeCellID)
    }
}
extension ViewController{
    override
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellID, for: indexPath)
        cell.textLabel?.text = "\(textArr[indexPath.row])"
        return cell
    }
    override
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            
            let alertVC = AlertViewController()
            self.navigationController?.pushViewController(alertVC, animated: true)
            
            break
        case 1:
            break
        default:
            break
        }
        
    }




}
