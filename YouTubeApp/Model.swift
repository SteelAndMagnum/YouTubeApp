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
            
            let response2:Response?
            
            // Check if there were any errors
            if error != nil || data == nil {
                
                return
            }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                response2 = response
                dump(response)
                dump(response2)
            }
            catch {
                
                print("Error occurred while decoding Response Object")
            }
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
