//
//  MovieEntity+CoreDataProperties.swift
//  
//
//  Created by Ahmed Hamam on 18/01/2023.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var image: String?
    @NSManaged public var title: String?

}
