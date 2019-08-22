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
    
    var collectionView: UICollectionView?
    
    @IBOutlet weak var segmentedContol: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setDarkTheme() {
        view.backgroundColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
   
        
        
    }
    
    func setLightTheme() {
        view.backgroundColor = .white
        navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.toolbar.barTintColor = .white
    }
    @IBAction func segmentedCotrollToggle(_ sender: UISegmentedControl) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.selectedSegmentIndex, forKey: .selectedSegmentIndex)
        
        if segmentedContol.selectedSegmentIndex == 0 {
            themePreference?.lightTheme = true
            collectionView?.reloadData()
            setLightTheme()
        } else {
            themePreference?.lightTheme = false
            collectionView?.reloadData()
            setDarkTheme()
        }
    }
}
