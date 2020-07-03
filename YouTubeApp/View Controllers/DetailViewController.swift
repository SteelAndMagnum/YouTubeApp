//
//  DetailViewController.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 7/1/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

// STEP 62 BEGINS: Add this File Class

import UIKit
// STEP 75 BEGINS: 
import WebKit

class DetailViewController: UIViewController {
    
    // STEP 74 BEGINS
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    // STEP 74 ENDS

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // STEP 77 BEGINS
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the Fields so none is remaining from the perious display
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // Check if there is a video
        guard video != nil else {
            
            return
        }
        
        // STEP 80 BEGINS
        // Create the embed URL
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // Load it into the webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the date
        // set format for date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        // Set the description
        textView.text = video!.description
        // STEP 80 ENDS
    }
    // STEP 77 ENDS

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}













