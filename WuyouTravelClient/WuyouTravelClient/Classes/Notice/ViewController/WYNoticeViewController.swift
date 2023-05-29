//
//  WYNoticeViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/10.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material

class WYNoticeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - init control

extension WYNoticeViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("消息")
    }

    fileprivate func initTableView() {
        tableView = UITableView.init(frame: view.frame, style: .grouped)
        view.addSubview(tableView!)
        tableView?.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        tableView?.backgroundColor = UIColor.globalBackgroundColor()
        tableView?.isScrollEnabled = true
        tableView?.separatorStyle = .none
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0 * kHeightRatio
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 49.0 * kHeightRatio
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1 * kHeightRatio
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kCellId) as? WYNoticeTableViewHeaderView
        if headerView == nil {
            headerView = WYNoticeTableViewHeaderView.init(reuseIdentifier: kCellId)
        }
        headerView?.dateView?.dateLabel?.text = String.init("2017-08-10 11:00")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYNoticeTableViewCell
        if cell == nil {
            cell = WYNoticeTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        switch indexPath.section {
        case 0:
            cell?.iconView?.image = UIImage.init(named: "notice_icon_27x27_")
            cell?.titleLabel?.text = String.init("无忧出行正式登陆云南地区")
            cell?.imgView?.image = UIImage.init(named: "notice_img_311x110_")
            cell?.bodyLabel?.text = String.init("无忧出行正式登陆云南地区，为了回馈广大用户的支持，无忧出行特推出“新人享新礼活动”；凡在2017年9月1日到10月1日注册登录的用户，均可获得168元代金券，可用于无忧出行APP内的各类服务。")
        default:
            cell?.iconView?.image = UIImage.init(named: "gift_icon_27x27_")
            cell?.titleLabel?.text = String.init("168元新人大礼包，即刻领取")
            cell?.imgView?.image = UIImage.init(named: "gift_img_311x110_")
            cell?.bodyLabel?.text = String.init("为了回馈广大用户的支持，无忧出行特推出“新人享新礼活动”；凡在2017年9月1日到10月1日注册登录的用户，均可获得168元代金券，可用于无忧出行APP内的各类服务。")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = WYNoticeDetailViewController.init()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
