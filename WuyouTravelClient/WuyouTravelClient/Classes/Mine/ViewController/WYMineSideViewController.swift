//
//  WYMineSideViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material
import SnapKit

class WYMineSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var tabHeaderView: WYMineHeaderView!
    var tabFooterView: WYMineFooterView!
    var secHeaderView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initTabHeaderView()
        initSecHeaderView()
        initTabFooterView()
        initTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension WYMineSideViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initTabHeaderView() {
        tabHeaderView = WYMineHeaderView()
        view.addSubview(tabHeaderView)
        tabHeaderView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(215.0 * kHeightRatio)
        }
        tabHeaderView.backgroundColor = UIColor.globalThemeDefaultColor()
        tabHeaderView.cancelBtn.addTarget(self, action: #selector(handleCancelBtnEvent), for: .touchUpInside)
        tabHeaderView.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(handleHeaderViewEvent(tap:)))
        tabHeaderView.addGestureRecognizer(tapGes)
        tabHeaderView.telNumberLabel.text = String.init("159****8579")
        tabHeaderView.comNameLabel.text = String.init("南京无忧出行有限责任公司")
    }
    
    fileprivate func initSecHeaderView() {
        secHeaderView = UIView.init()
        view.addSubview(secHeaderView)
        secHeaderView.snp.makeConstraints { (make) in
            make.left.right.equalTo(tabHeaderView)
            make.top.equalTo(tabHeaderView.snp.bottom)
            make.height.equalTo(34.0 * kHeightRatio)
        }
        secHeaderView.backgroundColor = UIColor.white
    }
    
    fileprivate func initTabFooterView() {
        tabFooterView = WYMineFooterView()
        view.addSubview(tabFooterView)
        tabFooterView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(67.0 * kHeightRatio)
        }
        tabFooterView.backgroundColor = UIColor.white
    }
    
    fileprivate func initTableView() {
        tableView = UITableView.init()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(secHeaderView.snp.bottom)
            make.bottom.equalTo(tabFooterView.snp.top)
            make.left.right.equalTo(view)
        }
        tableView.backgroundColor = UIColor.white
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kFirCellHeight * kHeightRatio
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYMineSideTableViewCell
        if cell == nil {
            cell = WYMineSideTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell?.sideIconView.image = UIImage.init(named: "mine_order_icon_15x17_")
            cell?.sideTextLabel.text = String.init("我的订单")
            cell?.sideIconView.snp.updateConstraints { (make) in
                make.left.equalTo(cell!).offset(41.0 * kWidthRatio)
                make.centerY.equalTo(cell!)
                make.width.equalTo(15.0 * kWidthRatio)
                make.height.equalTo(17.0 * kHeightRatio)
            }
            cell?.sideTextLabel.snp.makeConstraints { (make) in
                make.left.equalTo(cell!.sideIconView.snp.right).offset(19.0 * kWidthRatio)
                make.centerY.equalTo(cell!.sideIconView)
                make.height.equalTo(16.0 * kHeightRatio)
            }
        case 1:
            cell?.sideIconView.image = UIImage.init(named: "mine_account_icon_14x19_")
            cell?.sideTextLabel.text = String.init("我的账户")
            cell?.sideIconView.snp.updateConstraints { (make) in
                make.left.equalTo(cell!).offset(41.0 * kWidthRatio)
                make.centerY.equalTo(cell!)
                make.width.equalTo(14.0 * kWidthRatio)
                make.height.equalTo(19.0 * kHeightRatio)
            }
            cell?.sideTextLabel.snp.makeConstraints { (make) in
                make.left.equalTo(cell!.sideIconView.snp.right).offset(19.0 * kWidthRatio)
                make.centerY.equalTo(cell!.sideIconView)
                make.height.equalTo(16.0 * kHeightRatio)
            }

        case 2:
            cell?.sideIconView.image = UIImage.init(named: "mine_rule_icon_15x17_")
            cell?.sideTextLabel.text = String.init("用车规则")
            cell?.sideIconView.snp.updateConstraints { (make) in
                make.left.equalTo(cell!).offset(41.0 * kWidthRatio)
                make.centerY.equalTo(cell!)
                make.width.equalTo(15.0 * kWidthRatio)
                make.height.equalTo(17.0 * kHeightRatio)
            }
            cell?.sideTextLabel.snp.makeConstraints { (make) in
                make.left.equalTo(cell!.sideIconView.snp.right).offset(19.0 * kWidthRatio)
                make.centerY.equalTo(cell!.sideIconView)
                make.height.equalTo(16.0 * kHeightRatio)
            }
        case 3:
            cell?.sideIconView.image = UIImage.init(named: "mine_voucher_icon_18x13_")
            cell?.sideTextLabel.text = String.init("代金券")
            cell?.sideIconView.snp.updateConstraints { (make) in
                make.left.equalTo(cell!).offset(40.0 * kWidthRatio)
                make.centerY.equalTo(cell!)
                make.width.equalTo(18.0 * kWidthRatio)
                make.height.equalTo(13.0 * kHeightRatio)
            }
            cell?.sideTextLabel.snp.makeConstraints { (make) in
                make.left.equalTo(cell!.sideIconView.snp.right).offset(17.0 * kWidthRatio)
                make.centerY.equalTo(cell!.sideIconView)
                make.height.equalTo(16.0 * kHeightRatio)
            }
        default:
            cell?.sideIconView.image = UIImage.init(named: "mine_setting_icon_17x17_")
            cell?.sideTextLabel.text = String.init("设置")
            cell?.sideIconView.snp.updateConstraints { (make) in
                make.left.equalTo(cell!).offset(40.0 * kWidthRatio)
                make.centerY.equalTo(cell!)
                make.width.equalTo(17.0 * kWidthRatio)
                make.height.equalTo(17.0 * kHeightRatio)
            }
            cell?.sideTextLabel.snp.makeConstraints { (make) in
                make.left.equalTo(cell!.sideIconView.snp.right).offset(18.0 * kWidthRatio)
                make.centerY.equalTo(cell!.sideIconView)
                make.height.equalTo(16.0 * kHeightRatio)
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        switch indexPath.row {
        case 0:
            print("我的订单")
            let orderVC = WYMyOrderViewController.init()
            closeNavigationDrawer(result: true)
            (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(orderVC, animated: true)
        case 1:
            print("我的账户")
            
            let accountVC = WYMyAccountViewController.init()
            closeNavigationDrawer(result: true)
            (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(accountVC, animated: true)
        case 2:
            print("用车规则")
            let loginVC = WYLoginViewController.init()
            closeNavigationDrawer(result: true)
            (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(loginVC, animated: true)
        case 3:
            print("代金券")
            
            let voucherVC = WYVoucherViewController.init()
            closeNavigationDrawer(result: true)
            (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(voucherVC, animated: true)
        default:
            print("设置")
            
            let settingVC = WYMySettingViewController.init()
            closeNavigationDrawer(result: true)
            (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(settingVC, animated: true)
        }
    }
}

extension WYMineSideViewController {
    @objc fileprivate func handleCancelBtnEvent() {
        print("handleCancelBtnEvent -> closeLeftView")
        navigationDrawerController?.closeLeftView()
    }
    
    @objc fileprivate func handleHeaderViewEvent(tap: UITapGestureRecognizer) {
        print("handleHeaderViewEvent")
        let myInfoVC = WYMyInfoViewController.init()
        closeNavigationDrawer(result: true)
        (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(myInfoVC, animated: true)
    }
    
    fileprivate func closeNavigationDrawer(result: Bool) {
        navigationDrawerController?.closeLeftView()
    }

}
