//
//  Constants.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/29/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyBPNdYqVd7F40PFfVTse-62K17KUmD9ZuQ"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
