//
//  ViewController.swift
//  RafIosScrabbleSolver
//
//  Created by Volare on 16/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tile = ScrabbleTileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        self.view.addSubview(tile)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

