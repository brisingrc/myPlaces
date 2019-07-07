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
    
    var places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        if place.image == nil{
            cell.imageOfPlace.image = UIImage(named: place.restarauntImage!)
        } else {
            cell.imageOfPlace.image = place.image
        }
        
//        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
         

        return cell
    }
    
    // Table View Delegate
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 85
//    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
    guard let newPlaceVC = segue.source as? NewPlaceViewController else {return}
    newPlaceVC.saveNewPlace()
    places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
}
}
