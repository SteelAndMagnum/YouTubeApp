//
//  CacheManager.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 7/1/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

// STEP 56 BEGINS: Creat This File to cache alreading loaded video images to facilitate usability of the cells as they go off and out of the screen without having to have the app to continually download them from the net as they scroll out and in to the screen view.

import Foundation

// STEP 57 BEGINS
class CacheManager {
    
    // To store Data
    static var cache = [String:Data]()
    
    static func setVideoCache (_ url:String, _ data:Data?){
        
        // Store the image and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
    }
    
}
// STEP 57 ENDS
