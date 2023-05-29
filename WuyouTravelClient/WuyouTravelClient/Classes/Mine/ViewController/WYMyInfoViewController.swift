//
//  WYMyInfoViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var sexTypeView: WYSexTypeView?
    var sexType: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initTableView()
        initSexTypeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension WYMyInfoViewController {
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
    
    fileprivate func initSexTypeView() {
        let window = UIApplication.shared.keyWindow
        sexTypeView = WYSexTypeView.init()
        window?.addSubview(sexTypeView!)
        sexTypeView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(window!)
        })
        sexTypeView?.manButton?.addTarget(self, action: #selector(clickManBtnEvent(btn:)), for: .touchUpInside)
        sexTypeView?.womanButton?.addTarget(self, action: #selector(clickWomanBtnEvent(btn:)), for: .touchUpInside)
    }
    
    @objc fileprivate func clickManBtnEvent(btn: UIButton) {
        print("clickManBtnEvent")
        sexType = true
        tableView?.reloadData()
    }
    
    @objc fileprivate func clickWomanBtnEvent(btn: UIButton) {
        print("clickWomanBtnEvent")
        sexType = false
        tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80.0 * kHeightRatio
        default:
            return kSecCellHeight * kHeightRatio
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYMyInfoTableViewCell
        if cell == nil {
            cell = WYMyInfoTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell?.subTitleLabel?.isHidden = true
            cell?.sexLabel?.isHidden = true
            cell?.titleLabel?.text = String.init("头像")
        case 1:
            cell?.avatarImgView?.isHidden = true
            cell?.arrowImgView?.isHidden = true
            cell?.titleLabel?.text = String.init("昵称")
            cell?.subTitleLabel?.text = String.init("无忧出行")
        case 2:
            cell?.avatarImgView?.isHidden = true
            cell?.arrowImgView?.isHidden = true
            cell?.titleLabel?.text = String.init("手机号")
            cell?.subTitleLabel?.text = String.init("159****8579")
        default:
            cell?.subTitleLabel?.isHidden = true
            cell?.avatarImgView?.isHidden = true
            cell?.titleLabel?.text = String.init("性别")
            cell?.sexLabel?.text = sexType ? String.init("男") : String.init("女")
            
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("头像")
        case 1:
            print("昵称")
        case 2:
            print("手机号")
        default:
            print("性别")
            
            sexTypeView?.isHidden = false
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.sexTypeView?.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: kAlpha)
                self.sexTypeView?.bottomContentView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.sexTypeView!)
                })
                self.sexTypeView?.layoutIfNeeded()
            }, completion: nil)
        }
    }

}
