//
//  MainViewController.swift
//  myPlaces
//
//  Created by Мак on 7/1/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
//  
    
    let places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image)
//        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
         

        return cell
    }
    
    // Table View Delegate
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 85
//    }
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue){}
    

}
