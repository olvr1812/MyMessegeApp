//
//  AllGroupsController.swift
//  VKapp
//
//  Created by Оливер Салихов on 24.01.2022.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    var all_groups: [infoGroupInView] = [.init(name: "News", image: "news"),
                                          .init(name: "Kittys", image: "kotiki"),
                                          .init(name: "Healthy Lifestyle", image: "zog"),
                                          .init(name: "Scandals", image: "scandal"),
                                          .init(name: "KriptoNews", image: "kripta")]
    let searchController = UISearchController(searchResultsController: nil)
    var filteredGroups: [infoGroupInView] = []
    
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    let cellGroupID = "cellGroupID"
    
    @IBOutlet var allGroupsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.placeholder = "Поиск групп"
        
        navigationItem.searchController = searchController
        
        definesPresentationContext = true
        tableView.reloadData()
        
        var url = URLComponents()
        
        url.scheme = "https"
        url.host = "api.vk.com"
        url.path = "/method/groups.search"
        url.queryItems = [
            URLQueryItem(name: "access_token", value: Session.session.token),
            URLQueryItem(name: "q", value: "a"),
            URLQueryItem(name: "sorted", value: "0"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        var request = URLRequest(url: url.url!)
        
        request.httpMethod = "GET"
        
        
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { data, respone, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else { return }
        }
        
        task.resume()
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isFiltering {
            return filteredGroups.count
        }
        
        return all_groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellGroupID, for: indexPath) as! AllGroupCell
        
        let data: infoGroupInView
        
        if isFiltering {
            data = filteredGroups[indexPath.row]
          } else {
            data = all_groups[indexPath.row]
          }
        
        
        
        cell.infoInCell(with: data)

        // Configure the cell...

        return cell
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredGroups = all_groups.filter {
            (all_groups: infoGroupInView) -> Bool in
            return all_groups.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}

extension AllGroupsController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      filterContentForSearchText(searchBar.text!)
  }
}
