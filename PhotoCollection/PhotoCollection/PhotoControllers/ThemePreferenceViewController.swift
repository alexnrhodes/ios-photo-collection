//
//  ThemePreferenceViewController.swift
//  PhotoCollection
//
//  Created by Alex Rhodes on 8/20/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class ThemePreferenceViewController: UIViewController {
    
    var themePreference: ThemePreference?
    
    @IBOutlet weak var segmentedContol: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func segmentedCotrollToggle(_ sender: UISegmentedControl) {
        
        if segmentedContol.selectedSegmentIndex == 0 {
            themePreference?.lightTheme = true
            themePreference?.darkTheme = false
        } else {
            themePreference?.darkTheme = true
            themePreference?.lightTheme = false
        }
    }
}
