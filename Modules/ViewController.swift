//
//  ViewController.swift
//  Practice
//
//  Created by 陈林波 on 2020/9/23.
//

import UIKit

class ViewController: XXBaseViewController , UITableViewDelegate, UITableViewDataSource {

    lazy var tv : UITableView = {
        let tv : UITableView = UITableView.init(frame: self.view.bounds)
        tv.delegate = self;
        tv.dataSource = self;
        tv.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        tv.register(XXTableViewCell.classForCoder(), forCellReuseIdentifier: "XXTableViewCell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tv)
        print("classForCoder:\(UITableViewCell.classForCoder())&self:\(UITableViewCell.self)")
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "UI"
            return cell
        }
        else
        {
            let cell:XXTableViewCell = tableView.dequeueReusableCell(withIdentifier: "XXTableViewCell", for: indexPath) as! XXTableViewCell
            cell.imageV.image = UIImage.init(named: "bookhoom_click")
            cell.titleLbl.text = "你好"
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            let vc : BookShelfViewController = BookShelfViewController.init()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

