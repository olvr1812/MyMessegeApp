//
//  AllFriendsController.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//
import UIKit
import Alamofire


final class AllFriendsController: UITableViewController, UIGestureRecognizerDelegate {
    
    
    
    @IBOutlet var friendsTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var friendCellID = "friendCellID"
    var friendHeaderIdentifier = "headerForFriendListID"
    
    var friends = [User]() {
        didSet {
            for friend in friends where friend.first_name != "DELETED" {
                friendsDict.removeAll()
                friends.sort()
                for i in friends.indices {
                    let letterKey = String((friends[i].last_name).prefix(1))
                    if var friendsOnLetterKey = friendsDict[letterKey] {
                        friendsOnLetterKey.append(friends[i])
                        friendsDict[letterKey] = friendsOnLetterKey
                    } else {
                        friendsDict[letterKey] = [friends[i]]
                    }
                }
                friendsSectionsNames = [String](friendsDict.keys).sorted(by: { $0 < $1 })
            }
            DispatchQueue.main.async {
                self.friendsFiltDict = self.friendsDict
                self.tableView.reloadData()
                self.networkFuncs.UserDateKeeper(self.friends)
            }
        }
    }
    
    var friendsDict = [String: [User]]()
    var friendsSectionsNames = [String]()
    var friendsFiltDict = [String: [User]]()
    
    private let networkFuncs = NetworkFuncs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        friendsTableView.rowHeight = 72
        
        registerTableView()
        registerHeaderTableView()
        
        networkFuncs.getFriends() { [weak self] result in
            switch result {
            case .success(let responseFriends):
                self?.friends = responseFriends.items
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSectionsNames.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsFiltDict[friendsSectionsNames[section]]!.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSectionsNames
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendCellID, for: indexPath) as? AllFriendsCell else { return UITableViewCell() }
        
        let letterKey = friendsSectionsNames[indexPath.section]
        if let friendsOnLetterKey = friendsFiltDict[letterKey] {
            let myFriend = friendsOnLetterKey[indexPath.row]
            let infoFriend = friendsLabel(name: myFriend.first_name, surname: myFriend.last_name, photo: myFriend.photo_200)
            cell.infoInCell(with: infoFriend)
        }
        return cell
    }
    
    
    
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            var cellFriendInfo = friendsLabel(name: nil, surname: nil, photo: nil)
    
            let letterKey = friendsSectionsNames[indexPath.section]
            
            if let selectedSection = friendsFiltDict[letterKey] {
                let selectedFriend = selectedSection[indexPath.row]
                
                let infoSelectFriend = friendsLabel(name: selectedFriend.first_name, surname: selectedFriend.last_name, photo: selectedFriend.photo_200)
                cellFriendInfo = infoSelectFriend
            }
            
            let friendInfoSender = cellFriendInfo
    
            performSegue(withIdentifier: "friendPriofile", sender: friendInfoSender)
        }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        if editingStyle == .delete {
    //
    //            friendsCellList_S.remove(at: indexPath.row)
    //
    //            // Delete the row from the data source
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //
    //        } else if editingStyle == .insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //        }
    //    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
            guard segue.identifier == "friendPriofile", let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destination = segue.destination as? PhotoCollectionViewCell else { return }
            let letterKey = friendsSectionsNames[indexPath.section]
    
            if let friendsOnLetterKey = friendsFiltDict[letterKey] {
                destination.FriendPhoto.downloaded(from: friendsOnLetterKey[indexPath.row].photo_200)
            }
    
    
            if segue.identifier == "friendPriofile" {
    
                guard let collectionViewController = segue.destination as? PhotosCollectionViewController, let cellFriendInfo = sender as? friendsLabel else {return}
                if cellFriendInfo.name == "Simba" {
                    collectionViewController.userInfo = [
                        .init(name: "Simba", surname: "", photo: "simb1"),
                        .init(name: "Simba", surname: "", photo: "simb2"),
                        .init(name: "Simba", surname: "", photo: "simb3")
                    ]
                } else if cellFriendInfo.name == "Hercules" {
                    collectionViewController.userInfo = [
                        .init(name: "Hercules", surname: "", photo: "herc1"),
                        .init(name: "Hercules", surname: "", photo: "herc2"),
                        .init(name: "Hercules", surname: "", photo: "herc3"),
                        .init(name: "Hercules", surname: "", photo: "herc4")]
                } else if cellFriendInfo.name == "James P." {
                    collectionViewController.userInfo = [
                        .init(name: "James P. Sallyvan", surname: "", photo: "sal1"),
                        .init(name: "James P. Sallyvan", surname: "", photo: "sal2"),
                        .init(name: "James P. Sallyvan", surname: "", photo: "sal3")]
                } else if cellFriendInfo.name == "Stuart" {
                    collectionViewController.userInfo = [
                        .init(name: "Stuart Little", surname: "", photo: "lit1"),
                        .init(name: "Stuart Little", surname: "", photo: "lit2"),
                        .init(name: "Stuart Little", surname: "", photo: "lit3")]
                } else if cellFriendInfo.name == "Mike" {
                    collectionViewController.userInfo = [
                        .init(name: "Mike Vazovsky", surname: "", photo: "mik1"),
                        .init(name: "Mike Vazovsky", surname: "", photo: "mik2"),
                        .init(name: "Mike Vazovsky", surname: "", photo: "mik3")]
                }
                collectionViewController.userInfo.append(cellFriendInfo)
            }
        }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: friendHeaderIdentifier) as! HeaderForCellViewController
        
        let letterKey = friendsSectionsNames[section]
        
        headerCell.headerLabel.text = letterKey
        
        return headerCell
    }
    
}

private extension AllFriendsController {
    func registerTableView() {
        tableView.register(AllFriendsCell.nib(), forCellReuseIdentifier: "friendCellID")
    }
}


extension AllFriendsController {
    func registerHeaderTableView() {
        tableView.register(HeaderForCellViewController.nib(), forCellReuseIdentifier: friendHeaderIdentifier)
    }
}

extension AllFriendsController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        guard !searchText.isEmpty else {
            friendsFiltDict = friendsDict
            friendsSectionsNames = [String](friendsFiltDict.keys).sorted()
            tableView.reloadData()
            return
        }
        
        friendsFiltDict.removeAll()
        friendsSectionsNames.removeAll()
        
        for key in friendsDict.keys {
            guard let friend = friendsDict[key] else { return }
            friendsFiltDict[key] = friend.filter({ $0.fullName.lowercased().contains(searchText.lowercased()) })
        }
        
        friendsSectionsNames = ([String](friendsFiltDict.keys).sorted())
            .filter({ !friendsFiltDict[$0]!.isEmpty })
        tableView.reloadData()
    }
}

