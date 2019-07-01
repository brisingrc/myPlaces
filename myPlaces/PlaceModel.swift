//
//  PlaceModel.swift
//  myPlaces
//
//  Created by Мак on 7/2/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation

struct Place {
    var name: String
    var location: String
    var type: String
    var image: String
    
       static let restarauntNames = ["Эпоха", "Вечное небо","Koreana"]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        for place in restarauntNames {
            places.append(Place(name: place, location: "Астана", type: "Ресторан", image: place))
        }
        return places
    }
}
