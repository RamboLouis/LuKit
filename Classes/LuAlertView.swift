//
//  LuAlertView.swift
//  LuDemo
//
//  Created by 路政浩 on 2017/3/22.
//  Copyright © 2017年 RamboLu. All rights reserved.
//

import UIKit

public class LuAlertView :NSObject{
    
    class func showTopFilterView(_ indexTextArr:[String]){
        LuTopAlertView().showFilterAlertView(textArr: indexTextArr)
    }
    
    ///   底部列表弹框
    ///   - alertType   : 数组第一参数      例如: 0.默认列表,1.上灰色下红色列表
    ///   - indexTextArr: 传入一个字符串数组 例如: ["0","测试1","测试2"]
    ///   - block       : 回调输出角标数
    class func showBottomTableView(_ indexTextArr:[String],bottomAction block:((_ IndexPathNum:Int?)->Void)?){
        LuBottomAlertView().showBottomTableView(indexTextArr: indexTextArr,bottomActionblock: block)
    }
    
    ///   底部时间轴
    ///
    ///   - block       : 回调输出年龄
    class func showBottomDatePickerView(_ bottomActionblock:((_ IndexPathNum:Int?)->Void)?) {
        LuBottomAlertView().showBottomDatePickerView(bottomActionblock: bottomActionblock)
    }
}
