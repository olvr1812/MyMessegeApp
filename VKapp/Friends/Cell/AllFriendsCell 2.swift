//
//  AllFriendsCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 29.01.2022.
//

import UIKit

class AllFriendsCell: UITableViewCell {
    
    static func nib() -> UINib {
        
        return UINib(nibName: "AllFriendsCell", bundle: nil)
    }
    
    @IBOutlet private var friendName: UILabel!
    @IBOutlet weak var friendSurname: UILabel!
    @IBOutlet weak var friendAvatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func infoInCell(with info: friendsLabel) {
        friendName.text = info.name
        self.friendSurname.text = info.surname
        
        self.friendAvatar.downloaded(from: info.photo!)
        self.friendAvatar.clipsToBounds = true
        self.friendAvatar.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        self.friendAvatar.layer.borderWidth = 2
        self.friendAvatar.layer.borderColor = UIColor.black.cgColor
        self.friendAvatar.layer.cornerRadius = 35
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
