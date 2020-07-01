//
//  Response.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/30/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items:[Video]?
    
    enum CodingKeys:String, CodingKey {
        
        // Matches Property name above so no need to be assigned
        case items
    }
    
    init (from decoder:Decoder) throws {
        
        // Grab the items JSON
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse the items
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
}
