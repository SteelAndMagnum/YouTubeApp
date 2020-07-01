//
//  Video.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/29/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    //var snippet = ""
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    //var high = ""
    //var resourcesId = ""
    
    enum CodingKeys: String, CodingKey {
        // Specify the set of keys to be use
        
        // First specify the over arching JSOn in which all the key value pairs we are looking for resides
        case snippet // Contains all
        case thumbnail = "url" // Contains high
        case high //contains url
        case resourceId // Contains VideoId
        
        // Then specify all the keys of interest withing that block (snippet is the block in this case)
        case published = "publishedAt"
        // case title = "title" Cos name matches we do it as below. Same applies to the rest that are similar
        case title
        case description
        case videoId
    }
    
    init (from decoder: Decoder) throws {
        
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
        
        // Grab the thumbnail JSON
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        
        // Grab the high JSON
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        // Parse the url
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Grab the resourceId JSON
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        // Parse the videoId
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
        
    }
    
}






