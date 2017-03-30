//
//  AlertViewController.swift
//  LuDemo
//
//  Created by 路政浩 on 2017/3/22.
//  Copyright © 2017年 RamboLu. All rights reserved.
//

import UIKit
private let alertCellID = "alertCellID"

class AlertViewController: BaseViewController {

    fileprivate var alertTextArr = ["顶部.筛选弹框","底部.上红下灰样式列表","底部.相同样式列表","底部.年龄时间轴"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "弹框视图"
        self.view.backgroundColor = UIColor.white
        baseTableView.register(UITableViewCell.self, forCellReuseIdentifier: alertCellID)
    }
}

extension AlertViewController{
    override
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertTextArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: alertCellID, for: indexPath)
        cell.textLabel?.text = "\(alertTextArr[indexPath.row])"
        return cell
    }
    
    override
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            let str = ["测试","测试测试","测试","测试测试"]
            LuAlertView.showTopFilterView(str)
            break
        case 1:
            let str = ["0","测试测试测试1","测试测试测试2","测试测试测试3","测试测试测试4"]
            LuAlertView.showBottomTableView(str, bottomAction: { (num) in
                debugPrint("所选角标:\(num!)")
            })
            break
        case 2:
            let str = ["1","测试标题","测试测试测试"]
            LuAlertView.showBottomTableView(str, bottomAction: { (num) in
                debugPrint("所选角标:\(num!)")
            })
            break
        case 3:
            LuAlertView.showBottomDatePickerView({ (num) in
                debugPrint("年龄数值：\(num!)")
            })
            break
        default:
            break
        }
    }
}
