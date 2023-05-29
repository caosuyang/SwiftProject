//
//  WYVoucherTableViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYVoucherTableViewController: UITableViewController {
    
    var voucherType: Int?
    var voucherNoticeView: WYVoucherNoticeView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initVoucherTableViewBasic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initVoucherTableViewBasic() {
        tableView = UITableView.init(frame: view.frame, style: .grouped)
        tableView.contentInset = UIEdgeInsetsMake(kFirCellHeight * kWidthRatio, 0.0, kFirCellHeight * kWidthRatio, 0.0)
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.isScrollEnabled = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if voucherType == 0 {
            return 10
        } else if voucherType == 1 {
            return 2
        } else {
            return 4
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119.0 * kHeightRatio
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0 * kHeightRatio
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1 * kHeightRatio
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYVoucherTableViewCell
        if cell == nil {
            cell = WYVoucherTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        cell?.priceFigureLabel?.text = String.init("¥ 100")
        cell?.priceConditionLabel?.text = String.init("满100元可用")
        cell?.voucherTypeLabel?.text = String.init("专车优惠券")
        cell?.validDateLabel?.text = String.init("2015.10.01-2015.10.07有效")
        if voucherType == 0 {
            cell?.bgImgView?.image = UIImage.init(named: "voucher_valid_img_302x104_")
        } else if voucherType == 1 {
            cell?.bgImgView?.image = UIImage.init(named: "voucher_used_img_302x104_")
            cell?.voucherTypeLabel?.textColor = UIColor.globalPlaceholderColor()
            cell?.validDateLabel?.textColor = UIColor.globalPlaceholderColor()
        } else if voucherType == 2 {
            cell?.bgImgView?.image = UIImage.init(named: "voucher_expired_img_302x104_")
            cell?.voucherTypeLabel?.textColor = UIColor.globalPlaceholderColor()
            cell?.validDateLabel?.textColor = UIColor.globalPlaceholderColor()
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
