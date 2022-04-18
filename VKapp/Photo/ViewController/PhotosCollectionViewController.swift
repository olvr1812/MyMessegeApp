//
//  PhotosCollectionViewController.swift
//  VKapp
//
//  Created by Оливер Салихов on 24.01.2022.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var newView: UIView!
    
    var friendPhotoFilt = [Photo]()
    var usersPhoto = [Photo]() {
        didSet {
            
            DispatchQueue.main.async {
                self.friendPhotoFilt = self.usersPhoto
                self.collectionView.reloadData()
                print(self.usersPhoto)
                self.networkFunc.UserPhotoDateKeeper(self.friendPhotoFilt)
                
            }
        }
    }
    
    var userInfo = [friendsLabel]()
    
    private let networkFunc = NetworkFuncs()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkFunc.getUserPhoto() { [weak self] result in
            switch result {
            case .success(let responsePhotos):
                self?.usersPhoto = responsePhotos.items
            case .failure(let error):
                print(error)
            }
        }
        
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return userInfo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell() }
        
        let profileInfo = userInfo[indexPath.row]
        cell.infoInCell(with: profileInfo)
        
        
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate


    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    
    
}
