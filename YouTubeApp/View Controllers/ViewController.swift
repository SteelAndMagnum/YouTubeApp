//
//  ViewController.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/26/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

import UIKit

// STEP 23 BEGINS: Add protocol UITableViewDataSource for handling all data sources or assets
// STEP 27 BEGINS: Add protocol UITableViewDelegate for user interactions
// STEP 33 BEGINS: Add protocol ModelDelegate to handle content fetch (video in this case) in the background without holding program execution. This allows not to declare a return type fwhen the model() function is called.
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    // STEP 22 BEGINS
    @IBOutlet weak var tableView: UITableView!
    
    // STEP 7 BEGINS
    var model = Model()
    
    // STEP 29 BEGINS: Add this Variable
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // STEP 24 BEGINS
        // Conforms itself as the dataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        // STEP 24 ENDS
        
        // STEP 35 BEGINS: Set View Controller as the delegate
        // Set it self as the delegate of the model
        model.delegate = self
        
        model.getVideos()
        
        // STEP 7 ENDS
    }
    
    // STEP 81 BEGINS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirm that a video was selected
        guard tableView.indexPathsForSelectedRows != nil else {
            
            return
        }
        
        // Get a reference to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    // STEP 81 ENDS
    
    // MARK: - Model Delegate Methods
    
    // STEP 34 BEGINS:
    func videosFetched(_ videos: [Video]) {
        
        // Set returned videos to our videos properties
        self.videos = videos
        
        // Refress the tableView
        tableView.reloadData()
        
    }
    // STEP 34 ENDS
    
    // MARK: - TableView Methods
    
    // STEP 25 BEGINS: Declare Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // STEP 29 CONTINUES
        return videos.count
        // STEP 29 ENDS
    }
    
    // STEP 26 BEGINS: Declear Method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // STEP 30 BEGINS
        
        // STEP 53 BEGINS: Conform the data type to be returned "as VideoTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the Cell with the Data
        
        // STEP 37 BEGINS:
        /* Below was used for test: displaying only text
         
        // Get the title of the video in question
        let title = self.videos[indexPath.row].title
         
        cell.textLabel?.text = title
        */
        // STEP 37 ENDS
        
        // STEP 54 BEGINS:
        // Grab the specific video for cell to display
        let video = self.videos[indexPath.row]
        
        // Pass obtained video to set cell
        cell.setCell(video)
        // STEP 54 ENDS
        
        // Return the Cell
        return cell
        
        // STEP 30 ENDS
        
    }
    
    // STEP 28 BEGINS: Declare Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // More Tasks here
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    


}

