//
//  LuTopAlertView.swift
//  LuDemo
//
//  Created by 路政浩 on 2017/3/23.
//  Copyright © 2017年 RamboLu. All rights reserved.
//

import UIKit
let SCREENW                     = UIScreen.main.bounds.width
let SCREENH                     = UIScreen.main.bounds.height
let SCREEN_SCALE_WIDTH          = UIScreen.main.bounds.width / 750.0
let SCREEN_SCALE_HEIGHT         = UIScreen.main.bounds.height / 1334.0
private let topFilterAlertViewCellID = "topAlertViewCellID"

fileprivate enum topAlertType : Int {
    case FilterAlertView
    case SelectAlertView
}
class LuTopAlertView: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    fileprivate var strongSelf         : UIViewController?
    
    fileprivate var clickIndexPath     : IndexPath = IndexPath(item: 0, section: 0)
    
    fileprivate var filterAlertTextArr : [String]?
    
    /// 弹出筛选器
    fileprivate var topFilterAlertView : UICollectionView!
    
    
    func showFilterAlertView(textArr: [String]){
        showTopBaseView(topAlertType: .FilterAlertView, textArr: textArr)
    }
    
    private func showTopBaseView(topAlertType:topAlertType,textArr: [String]?){
        let window = UIApplication.shared.keyWindow!
        window.addSubview(view)
        window.bringSubview(toFront:view)
        strongSelf = self
        switch topAlertType {
        case .FilterAlertView:
            filterAlertTextArr = textArr
            setFilterAlertView()
            showAnimation(topFilterAlertView)
            break
        default:
            break
        }
        
    }
    
}
extension LuTopAlertView{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //        dismissAlert()
        hideAnimation(topFilterAlertView)
    }
    
}

// MARK: - 设置顶部筛选弹框视图
extension LuTopAlertView{
    
    fileprivate func setFilterAlertView(){
        view.frame = CGRect.init(x: 0, y: 64, width: SCREENW, height: SCREENH - 64)
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 750.0 * 120, height: UIScreen.main.bounds.height / 1334.0 * 60)
        flowLayout.sectionInset = UIEdgeInsets(top: SCREEN_SCALE_HEIGHT * 20, left: SCREEN_SCALE_WIDTH * 45, bottom: SCREEN_SCALE_HEIGHT * 20, right: SCREEN_SCALE_WIDTH * 45)
        
        flowLayout.minimumInteritemSpacing = SCREEN_SCALE_WIDTH * 40
        
        topFilterAlertView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: SCREENW, height: 0), collectionViewLayout: flowLayout)
        
        topFilterAlertView.backgroundColor = UIColor.white
        topFilterAlertView.delegate        = self
        topFilterAlertView.dataSource      = self
        topFilterAlertView.contentInset    = UIEdgeInsetsMake(0, 0, 0, 0)
        topFilterAlertView.register(LuTopFilterAlertViewCell.self, forCellWithReuseIdentifier: topFilterAlertViewCellID)
        
        view.addSubview(topFilterAlertView)
    }
}
extension LuTopAlertView{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        debugPrint("数组数量\(filterAlertTextArr?.count)")
        return filterAlertTextArr!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topFilterAlertViewCellID, for: indexPath) as! LuTopFilterAlertViewCell
        if indexPath.row == 0{
            cell.filterCellimageView.isHidden = false
            cell.filterCellLabel.textColor = UIColor.white
        }
        
        cell.filterCellLabel.text = filterAlertTextArr?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? LuTopFilterAlertViewCell
        if clickIndexPath != indexPath {
            let otherCell = collectionView.cellForItem(at: clickIndexPath) as? LuTopFilterAlertViewCell
            otherCell?.filterCellimageView.isHidden = true
            otherCell?.filterCellLabel.textColor    = UIColor.colorWithString("#888888")
        }
        clickIndexPath = indexPath
        cell?.filterCellimageView.isHidden = false
        cell?.filterCellLabel.textColor    = UIColor.white
        debugPrint("这是\(indexPath.row)个item")
        //        if indexNumBlock != nil{
        //            indexNumBlock!(indexPath.row)
        //        }
        
        //        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
        //            self.disAlert()
        //        })
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize = CGSize(width: SCREEN_SCALE_WIDTH * 120, height: SCREEN_SCALE_HEIGHT * 60)
        //        if filterAlertTextArr?[indexPath.row].characters.count == 4 {
        //            itemSize = CGSize(width: SCREEN_SCALE_WIDTH * 160 , height: SCREEN_SCALE_HEIGHT * 60)
        //        }
        let count = Int((filterAlertTextArr?[indexPath.row].characters.count)!)
        switch count {
        case 4 :
            itemSize = CGSize(width: SCREEN_SCALE_WIDTH * 160 , height: SCREEN_SCALE_HEIGHT * 60)
            break
        default:
            break
        }
        return itemSize
    }
}
extension LuTopAlertView{
    
    fileprivate func showAnimation(_ view: UIView){
        UIView.animate(withDuration: 0.2) {
            var frame = view.frame
            frame.size.height = 100
            view.frame = frame
        }
    }
    
    fileprivate func hideAnimation(_ view: UIView){
        UIView.animate(withDuration: 0.2, animations: {
            var frame = view.frame
            frame.size.height = 0
            view.frame = frame
        }) { (complete) in
            self.dismissAlert()
        }
    }
    
    fileprivate func dismissAlert(){
        view.removeFromSuperview()
        strongSelf = nil
    }
}

class LuTopFilterAlertViewCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var filterCellLabel = UILabel()
    
    lazy var filterCellimageView: UIView = {
        let filterCellimageView = UIView()
        filterCellimageView.backgroundColor          = UIColor.colorWithString("#888888")
        filterCellimageView.layer.cornerRadius       = SCREEN_SCALE_WIDTH * 5
        filterCellimageView.layer.masksToBounds      = true
        filterCellimageView.isUserInteractionEnabled = true
        return filterCellimageView
    }()
    
    func setUI(){
        backgroundColor              = UIColor.white
        filterCellLabel.text         = "测试"
        filterCellLabel.font         = UIFont.systemFont(ofSize: SCREEN_SCALE_WIDTH * 30)
        filterCellLabel.textColor    = UIColor.colorWithString("#888888")
        filterCellimageView.isHidden = true
        filterCellimageView.frame    = self.bounds
        
        contentView.addSubview(filterCellimageView)
        contentView.addSubview(filterCellLabel)
        filterCellLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}

