//
//  AllGroupCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 24.01.2022.
//

import UIKit

class AllGroupCell: UITableViewCell {
    
    @IBOutlet weak var allGroupName: UILabel!
    @IBOutlet weak var allGroupeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func infoInCell(with info: infoGroupInView) {
        allGroupName.text = info.name
        
        allGroupeImage.image = UIImage(named: info.image)
        
        
    }

}
