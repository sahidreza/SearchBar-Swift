//
//  SearchTableViewController.swift
//  SearchBarImplementation
//
//  Created by Sahid Reza on 11/01/23.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    
    @IBOutlet var seachTableView: UITableView!
    
    @IBOutlet weak var namelistSearchBar: UISearchBar!
    
    
    var nameList = ["Aby","ABu","Rahul","Broem","Bour","Nahi","Subhaijiy","Sahid"]
    var filterData:[String]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        namelistSearchBar.delegate = self
        filterData = nameList
        
     

    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tebleViewCell", for: indexPath)
        
        cell.textLabel?.text = filterData[indexPath.row]
        
       return cell
    }
   

}

extension SearchTableViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterData = []
        
        if searchText == ""{
        
            filterData = nameList
        }
        
        for word in nameList{
            if word.uppercased().contains(namelistSearchBar.text!.uppercased()){
                
                filterData.append(word)
                
            }
            
            
        }
        
        seachTableView.reloadData()
    }
    
    
}
