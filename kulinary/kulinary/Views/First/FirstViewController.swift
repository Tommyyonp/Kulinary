//
//  FirstViewController.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 27/06/22.
//

import UIKit

class FirstViewController: UIViewController {
    let defaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
        if(defaults.bool(forKey: "isFirstOpen") == true) {
            navigationController?.pushViewController(HomeViewController(), animated: true)
        }
    }

    @IBAction func didTapBtn(_ sender: Any) {
        defaults.setValue(true, forKey: "isFirstOpen")
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
