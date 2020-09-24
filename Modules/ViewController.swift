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
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "UI"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }
    }
    
    

    

}

