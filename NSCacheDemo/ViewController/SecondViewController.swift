//
//  SecondViewController.swift
//  NSCacheDemo
//
//  Created by Ganesh on 23/07/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var randomImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second"
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        fetchImage()
    }
    
    private func fetchImage() {
        ImageProvider.shared.fetchImage { [weak self] result in
            switch result {
            case .success(let downloadedImage):
                self?.randomImageView.image = downloadedImage
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
