//
//  ViewController.swift
//  100 day Swift
//
//  Created by Демьян Горчаков on 03.04.2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        var fm = FileManager.default
        var puth = Bundle.main.resourcePath!
        var items = try! fm.contentsOfDirectory(atPath: puth)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                pictures.sort(by: <)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Now picture is \(indexPath.row)"
        cell.textLabel?.font = .systemFont(ofSize: 20)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PictureView") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
