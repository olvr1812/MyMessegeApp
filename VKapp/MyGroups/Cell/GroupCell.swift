//
//  GroupCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func infoInView(with info: infoGroupInView) {
        
        groupName.text = info.name
        self.groupImage.downloaded(from: info.image)
//        groupImage.clipsToBounds = true
//        groupImage.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
//        groupImage.layer.borderWidth = 2
//        groupImage.layer.borderColor = UIColor.black.cgColor
//        groupImage.layer.cornerRadius = 35
//        groupImage.image
    }

}
