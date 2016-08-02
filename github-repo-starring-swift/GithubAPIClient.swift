//
//  GithubAPIClient.swift
//  github-repo-starring-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    /*
     MEMO
     dataTaskWithRequest if going to modify stuff
     dataTaskWithURL if just reading JSON
     gotta be mutable in order to have access to addValue and HTTPMethod
     */
    class func checkIfRepositoryIsStarred(fullname: String, completion: (Bool)-> ()){
        let urlString = "https://api.github.com/user/starred/\(fullname)"
        let url = NSURL(string: urlString)
        let session = NSURLSession.sharedSession()
        guard let gitHubURL = url else {
            print("things went south")
            return
        }
        
        let request = NSMutableURLRequest(URL: gitHubURL)
        request.HTTPMethod = "GET"
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        let task = session.dataTaskWithRequest(request){data,response,error in
            guard let responseValue = response as? NSHTTPURLResponse else{
                assertionFailure("omg how can i ever remember all this?!?!?!")
                return
            }
            if responseValue.statusCode == 204 {
                completion(true)
            }else if responseValue.statusCode == 404{
                completion(false)
            }else{
                print("other statusCode\(responseValue.statusCode)")
            }
            print(data)
            print(response)
            print(error)
        }
        task.resume()
    }
    
    
    class func getRepositoriesWithCompletion(completion: (NSArray)->()){
        
        let url = NSURL(string: "\(githubURLAPI)/repositories?client_id=\(id)&client_secret=\(secret)")
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        guard let gitHubURL = url else {
            print("things went south")
            return
        }
        
        
        session.dataTaskWithURL(gitHubURL) { (data, response, error) in
            
            if let data = data {
                //let responseData = NSString(data: data, encoding: NSUTF8StringEncoding)
                do{
                    
                    if let responseData = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray {
                        //print(responseData)
                        completion(responseData!)
                    }
                    
                }
            }
            
            }.resume()
        
    }
    
    
    
    class func starRepository(fullName: String, completion:()-> ()){
        let urlString = "https://api.github.com/user/starred/\(fullName)"
        let url = NSURL(string: urlString)
        let session = NSURLSession.sharedSession()
        guard let gitHubURL = url else {
            print("things went south")
            return
        }
        
        let request = NSMutableURLRequest(URL: gitHubURL)
        request.HTTPMethod = "PUT"
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        
        
        let task = session.dataTaskWithRequest(request){data,response,error in
            guard let responseValue = response as? NSHTTPURLResponse else{
                assertionFailure("omg how can i ever remember all this?!?!?!")
                return
            }
            if responseValue.statusCode == 204 {
                completion()
            }else{
                print("other statusCode\(responseValue.statusCode)")
            }
            print(data)
            print(response)
            print(error)
        }
        task.resume()
    }
    
    
    class func unStarRepository(fullName: String, completion:()-> ()){
        let urlString = "https://api.github.com/user/starred/\(fullName)"
        let url = NSURL(string: urlString)
        let session = NSURLSession.sharedSession()
        guard let gitHubURL = url else {
            print("things went south")
            return
        }
        
        let request = NSMutableURLRequest(URL: gitHubURL)
        request.HTTPMethod = "DELETE"
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        
        
        let task = session.dataTaskWithRequest(request){data,response,error in
            guard let responseValue = response as? NSHTTPURLResponse else{
                assertionFailure("omg how can i ever remember all this?!?!?!")
                return
            }
            if responseValue.statusCode == 204 {
                completion()
            }else{
                print("other statusCode\(responseValue.statusCode)")
            }
            print(data)
            print(response)
            print(error)
        }
        task.resume()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
//        let urlString = "\(githubAPIURL)/repositories?client_id=\(githubClientID)&client_secret=\(githubClientSecret)"
//        let url = NSURL(string: urlString)
//        let session = NSURLSession.sharedSession()
//        
//        guard let unwrappedURL = url else { fatalError("Invalid URL") }
//        let task = session.dataTaskWithURL(unwrappedURL) { (data, response, error) in
//            guard let data = data else { fatalError("Unable to get data \(error?.localizedDescription)") }
//            
//            if let responseArray = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray {
//                if let responseArray = responseArray {
//                    completion(responseArray)
//                }
//            }
//        }
//        task.resume()
//    }
    
}

