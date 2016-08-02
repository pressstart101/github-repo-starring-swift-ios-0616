//
//  ReposDataStore.swift
//  github-repo-starring-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories:[GithubRepository] = []
    
    
    
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        GithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
            self.repositories.removeAll()
            for dictionary in reposArray {
                guard let repoDictionary = dictionary as? NSDictionary else { fatalError("Object in reposArray is of non-dictionary type") }
                let repository = GithubRepository(dictionary: repoDictionary)
                self.repositories.append(repository)
                
            }
            completion()
        }
    }
    
    
    
    
    
    
    
    
    
    

    func toggleStarStatusForRepository(repository: GithubRepository, completion: ()-> ()){
        GithubAPIClient.checkIfRepositoryIsStarred(repository.fullName as String){ (starred) in if starred{
            GithubAPIClient.unStarRepository(repository.fullName as String, completion: {
                print("starring it")
                completion()
            })
        }else{
            GithubAPIClient.starRepository(repository.fullName as String, completion: {
                print("unstarring it")
                completion()
                
            })
            }
            
        }
        
        completion()
    }
    
    
    
//    
//    
//        static let sharedInstance = ReposDataStore()
//        private init() {}
//    
//        var repositories:[GithubRepository] = []
//    
//        func getRepositoriesWithCompletion(completion: () -> ()) {
//            GithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
//                self.repositories.removeAll()
//                for dictionary in reposArray {
//                    guard let repoDictionary = dictionary as? NSDictionary else { fatalError("Object in reposArray is of non-dictionary type") }
//                    let repository = GithubRepository(dictionary: repoDictionary)
//                    self.repositories.append(repository)
//    
//                }
//                completion()
//            }
//        }
//  
//    
//    
//    
//    
//    
//    
//    func getRepositoriesWithCompletion(completion:()->()){
//        GithubAPIClient.getRepositoriesWithCompletion{(tempArray) in
//            self.repositories.removeAll()
//            for git in tempArray{
//                let gitrepo = GithubRepository(dictionary: git as! NSDictionary)
//                self.repositories.append(gitrepo)
//                
//            }
//            
//            if self.repositories.count > 0{
//                completion()
//                
//            }
//            //print(tempArray)
//        }
//        
//    }
//    
    
    
    
    
    
    
    
    
    

}
