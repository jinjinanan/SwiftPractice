//
//  BookShelfViewController.swift
//  Practice
//
//  Created by 陈林波 on 2020/9/27.
//

import UIKit

class BookShelfViewController: XXBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    lazy var colV : UICollectionView = {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let col : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        col.translatesAutoresizingMaskIntoConstraints = false
        col.register(XSCollectionViewCell.self, forCellWithReuseIdentifier: "XSCollectionViewCell")
        col.delegate = self
        col.dataSource = self;
        
        return col
    }()

    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    func setupUI()  {
        self.view.addSubview(self.colV)
        
        let hConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[colV]|", options: [], metrics: nil, views: ["colV":self.colV])
        let vConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[colV]|", options: [], metrics: nil, views: ["colV":self.colV])
        self.view.addConstraints(hConstraint)
        self.view.addConstraints(vConstraint)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : XSCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "XSCollectionViewCell", for: indexPath) as! XSCollectionViewCell
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
    
    
    
    
    

 

}
