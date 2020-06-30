//
//  ViewController.swift
//  YouTubeApp
//
//  Created by steelandmagnum on 6/26/20.
//  Copyright © 2020 steelandmagnum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        model.getVideos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }


}

