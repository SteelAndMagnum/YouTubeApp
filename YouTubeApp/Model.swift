//
//  Model.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/29/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        
        // Get a URL session objects
        let session = URLSession.shared
        
        
        // Get a data task from the URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                
                return
            }
            
            // Parsing the data into video objects
        }
        
        // Kick off the task
        dataTask.resume()
        
        
    }
}
