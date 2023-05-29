//
//  WYMySettingViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import SVProgressHUD

class WYMySettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var logOutBtn: WYCancelOrderButton?
    var updateView: WYUpdatePromptView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initTableView()
        initLogOutBtn()
        initUpdateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension WYMySettingViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("设置")
    }
    
    fileprivate func initTableView() {
        tableView = UITableView.init()
        view.addSubview(tableView!)
        tableView?.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        tableView?.backgroundColor = UIColor.white
        tableView?.isScrollEnabled = false
        tableView?.separatorStyle = .none
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    fileprivate func initLogOutBtn() {
        logOutBtn = WYCancelOrderButton.init()
        view.addSubview(logOutBtn!)
        logOutBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(view).offset(26.0 * kWidthRatio)
            make.bottom.equalTo(view).offset(-24.0 * kHeightRatio)
            make.right.equalTo(view).offset(-26.0 * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        logOutBtn?.layer.borderColor = UIColor.globalThemeDefaultColor().cgColor
        logOutBtn?.setTitleColor(UIColor.globalThemeDefaultColor(), for: .normal)
        logOutBtn?.setTitle(String.init("退出登录"), for: .normal)
    }
    
    fileprivate func initUpdateView() {
        let window = UIApplication.shared.keyWindow
        updateView = WYUpdatePromptView.init()
        window?.addSubview(updateView!)
        updateView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(window!)
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kSecCellHeight * kHeightRatio
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYMySettingTableViewCell
        if cell == nil {
            cell = WYMySettingTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell?.titleLabel?.text = String.init("意见反馈")
        case 1:
            cell?.titleLabel?.text = String.init("给我评分")
        default:
            cell?.titleLabel?.text = String.init("关于我们")
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("意见反馈")
            let feedbackVC = WYFeedbackViewController.init()
            navigationController?.pushViewController(feedbackVC, animated: true)
        case 1:
            print("给我评分")
            updateView?.isHidden = false
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, usingSpringWithDamping: kSpringWithDamping, initialSpringVelocity: kSpringVelocity, options: [], animations: {
                self.updateView?.contentView?.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.updateView!).offset(225.0 * kHeightRatio)
                })
                self.updateView?.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: kAlpha)
                self.updateView?.contentView?.alpha = 1.0
                self.updateView?.layoutIfNeeded()
            }, completion: nil)
            
        default:
            print("关于我们")
            let aboutUsVC = WYAboutUsViewController.init()
            navigationController?.pushViewController(aboutUsVC, animated: true)
        }
    }
    
}
