//
//  MainViewController.swift
//  myPlaces
//
//  Created by Мак on 7/1/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
  

    var places: Results<Place>!

    override func viewDidLoad() {
        super.viewDidLoad()

        places = realm.objects(Place.self)
        print(places.count)
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let place = places[indexPath.row]

        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)

        

//        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true


        return cell
    }

    // Table View Delegate
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let place = places[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
    guard let newPlaceVC = segue.source as? NewPlaceViewController else {return}
    newPlaceVC.saveNewPlace()
  
        tableView.reloadData()
}
}
