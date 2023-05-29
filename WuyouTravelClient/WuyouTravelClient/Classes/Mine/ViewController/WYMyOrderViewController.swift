//
//  WYMyOrderViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/29.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material

class WYMyOrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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

extension WYMyOrderViewController {
    
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("我的订单")
        
    }
    
    fileprivate func initTableView() {
        tableView = UITableView.init()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (165.0 + 20.0) * kHeightRatio
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYMyOrderTableViewCell
        if cell == nil {
            cell = WYMyOrderTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        cell?.typeLabel?.text = String.init("专车")
        cell?.statusLabel?.text = String.init("已完成")
        cell?.timeView?.siteLabel?.text = String.init("8月1日 14:00")
        cell?.starPlaceView?.siteLabel?.text = String.init("上海浦东新区东方路世纪大道地铁站")
        cell?.endPlaceView?.siteLabel?.text = String.init("上海闵行区申贵路1500号")
        cell?.figureLabel?.text = String.init("116元")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = WYMyOrderDetailViewController.init()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
