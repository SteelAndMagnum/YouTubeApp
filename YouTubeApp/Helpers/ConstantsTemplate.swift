//
//  ConstantsTemplate.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/30/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

// STEP 15 BEGINS : Create the File

/*
 Add your own keys below and uncomment the code
 */

import Foundation


struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
 
    // STEP 21 BEGINS
    static var VIDEOCELL_ID = "VideoCell"
 
    // STEP 79 BEGINS: Declare var
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
 
}

