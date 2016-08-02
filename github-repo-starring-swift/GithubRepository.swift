//
//  GithubRepository.swift
//  github-repo-starring-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    var fullName: String
    var htmlURL: NSURL
    var repositoryID: String
    init(dictionary: NSDictionary) {
        guard let
            name = dictionary["full_name"] as? String,
            valueAsString = dictionary["html_url"] as? String,
            valueAsURL = NSURL(string: valueAsString),
            repoID = dictionary["id"]?.stringValue
            else { fatalError("Could not create repository object from supplied dictionary") }
        
        htmlURL = valueAsURL
        fullName = name
        repositoryID = repoID
    }
        
        
    }
    
    
    
    
//var fullName: NSString
//var htmlURL: NSURL
//var repositoryID: NSString
//
//init(dictionary:NSDictionary){
//    self.fullName = dictionary["full_name"] as! String
//    
//    
//    let urlString = dictionary["html_url"] as! String
//    self.htmlURL = NSURL(string: urlString)!
//    
//    self.repositoryID = (dictionary["id"]?.stringValue)!

    
    
    

    



