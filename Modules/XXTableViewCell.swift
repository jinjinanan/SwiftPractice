//
//  XXTableViewCell.swift
//  Practice
//
//  Created by 陈林波 on 2020/9/24.
//

import UIKit

class XXTableViewCell: UITableViewCell {

    lazy var imageV :UIImageView = {
        let imageV : UIImageView = UIImageView.init()
        imageV.translatesAutoresizingMaskIntoConstraints = false;
        imageV.setContentHuggingPriority(.required, for: .horizontal)
        return imageV
    }()
    
    lazy var titleLbl : UILabel = {
        let lbl : UILabel = UILabel.init()
        lbl.translatesAutoresizingMaskIntoConstraints = false;
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupUI() {
        self.contentView.addSubview(self.imageV)
        self.contentView.addSubview(self.titleLbl)
        
        
        self.contentView.addConstraint(NSLayoutConstraint.init(item: self.titleLbl, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0))
        let aConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[imageV]-10-[titleLbl]-10-|", options:[], metrics: nil, views: ["imageV":self.imageV,"titleLbl":self.titleLbl])
        self.contentView.addConstraints(aConstraints)
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[imageV]-20-|", options: [], metrics: nil, views: ["imageV":self.imageV])
        self.contentView.addConstraints(hConstraints)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
    

}
