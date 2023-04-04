//
//  SecondViewController.swift
//  100 day Swift
//
//  Created by Демьян Горчаков on 03.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var pictureNumber = ""
    var totalPicture = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageLoad = selectedImage {
            imageView.image = UIImage(named: imageLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
