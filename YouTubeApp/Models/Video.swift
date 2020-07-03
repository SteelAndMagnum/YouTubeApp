//
//  Video.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/29/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

// STEP 3 BEGINS: Create this file

import Foundation

// STEP 4 BEGINS:
struct Video : Decodable { // STEP 8 BGINS: Added Decodable
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
   // STEP 4 ENDS
    
    // STEP 10 BEGINS
    enum CodingKeys: String, CodingKey {
        // Specify the set of keys to be use
        
        // First specify the over arching JSOn in which all the key value pairs we are looking for resides
        case snippet // Contains all
        case thumbnails
        case high //contains url
        case resourceId // Contains VideoId
        
        // Then specify all the keys of interest withing that block (snippet is the block in this case)
        case published = "publishedAt"
        // case title = "title" Cos name matches we do it as below. Same applies to the rest that are similar
        case title
        case description
        case thumbnail = "url" // Contains high
        case videoId
    }
    // STEP 10 ENDS
    
    // STEP 9 BEGINS: Declare this function
    init (from decoder: Decoder) throws {
        
        // STEP 11 BEGINS
        // Call multi-nested pairs of Containers (meaning JSON object)
        // Grab the Items JSON object
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Grab the snippet JSON object in the Item container
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse the Description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Grab the thumbnails JSON
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        // Grab the high JSON
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        // Parse the url
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Grab the resourceId JSON
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        // Parse the videoId
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
        // STEP 11 ENDS
    }
    
}






