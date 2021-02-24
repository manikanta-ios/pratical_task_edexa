//
//  CityCell.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 25/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    
    
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        parentView.layer.borderColor = UIColor.lightGray.cgColor
        parentView.layer.borderWidth = 1
        parentView.layer.cornerRadius = 10
        indexLabel.layer.cornerRadius = indexLabel.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
