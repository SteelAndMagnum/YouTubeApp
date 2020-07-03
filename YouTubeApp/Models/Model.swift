//
//  Model.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/29/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

// STEP 5 BEGINS: Create this File

import Foundation

// STEP 32 BEGINS
protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
}
// STEP 32 ENDS

// STEP 6 BEGINS
class Model {
    
    // STEP 31 BEGINS: Declare and assigne this variable
    var delegate:ModelDelegate?
    
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
            
            //let response2:Response?
            
            // Check if there were any errors
            if error != nil || data == nil {
                
                return
            }
            
            // STEP 14 BEGINS
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                // STEP 36 BEGINS:
                if response.items != nil {
                    
                    // STEP 37 BEGINS: When the network data fetch is completed (on the background thread), the DispatchQueue below will handle retuning the fetched JSON data to the main thread. So the video fetch is now used to bound the video fetch below. that call wasnt haoused before.
                    DispatchQueue.main.async {
                        // Call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                // STEP 36 ENDS
                
                
                //response2 = response
                //dump(response)
                //dump(response2)
            }
            catch {
                
                print("Error occurred while decoding Response Object")
            }
            
            // STEP 14 ENDS
        }
        
        // Kick off the task
        dataTask.resume()
        
        // STEP 6 ENDS
    }
}
