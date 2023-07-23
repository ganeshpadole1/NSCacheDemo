//
//  FirstViewController.swift
//  NSCacheDemo
//
//  Created by Ganesh on 23/07/23.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"

        view.backgroundColor = .gray
    }
    
    @IBAction func goToNextVC(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
