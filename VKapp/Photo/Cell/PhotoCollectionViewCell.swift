//
//  PhotoCollectionViewCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 24.01.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var FriendPhoto: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func pressedLike(_ sender: Any) {
        if like == true {
            likeButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            likeButton.setTitle("0", for: .normal)
            like = false
        } else {
            likeButton.setTitle("1", for: .normal)
            likeButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            like = true
            
        }
    }
    
    var like: Bool = true
    
    
    func infoInCell(with info: friendsLabel) {
        //labelName.text = info.name
            
        FriendPhoto.image = UIImage(named: info.photo ?? "1")
        
        FriendPhoto.layer.borderWidth = 2
        FriendPhoto.layer.borderColor = UIColor.black.cgColor
        
        
        
            
    }
    
    
    
    
}
