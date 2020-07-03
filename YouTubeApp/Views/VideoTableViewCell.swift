//
//  VideoTableViewCell.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/30/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

// STEP 38 BEGINS: Create this File

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    // STEP 51 BEGINS: var to hold the video the cell is displaying at any given time
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // STEP 52 BEGINS
    func setCell(_ v:Video) {
        
        // Catpture video
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else {
            
            return
        }
        
        // Set the title and date
        self.titleLabel.text = video?.title
        
        // set format for date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            
            return
        }
        
        // STEP 58 BEGINS
        // Check Cache before downloading data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            // Set the Thumbnial imageview
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        // STEP 58 ENDS
        
        // Download the thumnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared url session object
        let session = URLSession.shared
        
        // Create a dataTask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if (error == nil) && (data != nil) {
                
                // STEP 59 BEGINS
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                // STEP 59 ENDS
                
                
                //Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    
                    // Video Cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Creat the image object
                let image = UIImage(data: data!)
                
                // Set the imageView
                DispatchQueue.main.async {
                    
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // Start data task
        dataTask.resume()
    }
}

// STEP 52 ENDS


















