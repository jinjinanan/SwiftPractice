//
//  XSCollectionViewCell.swift
//  Practice
//
//  Created by 陈林波 on 2020/9/27.
//

import UIKit

class XSCollectionViewCell: UICollectionViewCell {
    let imageV = UIImageView()
    let titleLbl = UILabel()
    let imgWidth = (kScreenWidth-20*4)/3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.contentView.addSubview(self.imageV)
        self.contentView.addSubview(self.titleLbl)
        self.imageV.translatesAutoresizingMaskIntoConstraints = false
        self.titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let hConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageV]|", options: [], metrics: nil, views: ["imageV":self.imageV])
        let hConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[titleLable]|", options: [], metrics: nil, views: ["titleLable":self.titleLbl])
        let vConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageV(==imageH)][titleLable]|", options: [], metrics: ["imageH":imgWidth*4/3], views: ["imageV":self.imageV,"titleLable":self.titleLbl])
        
        self.contentView.addConstraints(hConstraint)
        self.contentView.addConstraints(hConstraint1)
        self.contentView.addConstraints(vConstraint)
        
        
        
    }
}
