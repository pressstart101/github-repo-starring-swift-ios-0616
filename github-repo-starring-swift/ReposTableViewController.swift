//
//  ReposTableViewController.swift
//  github-repo-starring-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    var store = ReposDataStore.sharedInstance
    //var store: ReposDataStore = ReposDataStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        //definesPresentationContext = true
        self.tableView.accessibilityLabel = "tableView"
        self.tableView.accessibilityIdentifier = "tableView"
        store.getRepositoriesWithCompletion{
            NSOperationQueue.mainQueue().addOperationWithBlock(){
                self.tableView.reloadData()
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.store.repositories.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        let repository:GithubRepository = self.store.repositories[indexPath.row]
        cell.textLabel?.text = repository.fullName as String
        return cell
    }
    
   var alert1 = UIAlertController()
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedRepo = store.repositories[indexPath.row]
        let alert = UIAlertController.init(title:"", message: "", preferredStyle: .Alert)
        alert.accessibilityLabel = "You just starred \(selectedRepo.fullName)"
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        }
        alert.addAction(OKAction)

        
        GithubAPIClient.checkIfRepositoryIsStarred(selectedRepo.fullName as String) {(starred) in
            if starred{
                alert.message = "You just starred \(selectedRepo.fullName)"
                self.presentViewController(alert, animated: true, completion: nil)
            }else{
                alert.message = "You just starred \(selectedRepo.fullName)"
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        }
    store.toggleStarStatusForRepository(selectedRepo) { 
        print("done")
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    let store = ReposDataStore.sharedInstance
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.tableView.accessibilityLabel = "tableView"
//        self.tableView.accessibilityIdentifier = "tableView"
//        
//        store.getRepositoriesWithCompletion {
//            NSOperationQueue.mainQueue().addOperationWithBlock({ 
//                self.tableView.reloadData()
//            })
//        }
//    }
//
//    // MARK: - Table view data source
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.store.repositories.count
//    }
//
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
//
//        let repository:GithubRepository = self.store.repositories[indexPath.row]
//        cell.textLabel?.text = repository.fullName
//
//        return cell
//    }

}
