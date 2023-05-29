//
//  WYAccountDetailTableViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYAccountDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigationItem()
        initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initNavigationItem() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        navigationItem.title = String.init("明细")
    }
    
    private func initTableView() {
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kSecCellHeight * kHeightRatio
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYAccountDetailTableViewCell
        if cell == nil {
            cell = WYAccountDetailTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        cell?.typeLabel?.text = String.init("支出")
        cell?.dateLabel?.text = String.init("2017-07-30 18:00:08")
        cell?.figureLabel?.text = String.init("-86.0")
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
