//
//  ThemePreferenceViewController.swift
//  PhotoCollection
//
//  Created by Alex Rhodes on 8/20/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

enum Theme: Int {
    case light = 0
    case dark
}

class ThemePreferenceViewController: UIViewController {
    
    var photoController: PhotoController?
    
    var collectionView: UICollectionView?
    
    @IBOutlet weak var segmentedContol: UISegmentedControl!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViews()
    }
    
    private func setViews() {
        
        let userDefaults = UserDefaults.standard
        segmentedContol.selectedSegmentIndex = userDefaults.integer(forKey: .selectedSegmentIndex)
        
        let themePreference = UserDefaults.standard.integer(forKey: .selectedSegmentIndex)
        
        guard let themeStyle = Theme(rawValue: themePreference) else { return }
        
        if themeStyle == .light {
            setLightTheme()
            
        } else {
            setDarkTheme()
        }
       
    }
    
    func setDarkTheme() {
        view.backgroundColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
//        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        
    }
    
    func setLightTheme() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    @IBAction func segmentedCotrollToggle(_ sender: UISegmentedControl) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.selectedSegmentIndex, forKey: .selectedSegmentIndex)
        
        let themePreference = UserDefaults.standard.integer(forKey: .selectedSegmentIndex)

        
        guard let themeStyle = Theme(rawValue: themePreference) else { return }

        if themeStyle == .light {
            setLightTheme()
            
        } else {
            setDarkTheme()
        }
       
    }
}
