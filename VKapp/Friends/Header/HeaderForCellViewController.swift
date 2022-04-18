//
//  HeaderForCellViewController.swift
//  VKapp
//
//  Created by Оливер Салихов on 02.02.2022.
//

import UIKit

class HeaderForCellViewController: UITableViewCell {
    
    static func nib() -> UINib {
        
        return UINib(nibName: "HeaderForCellViewController", bundle: nil)
    }
    

    @IBOutlet public var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
