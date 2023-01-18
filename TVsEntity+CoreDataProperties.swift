//
//  TVsEntity+CoreDataProperties.swift
//  
//
//  Created by Ahmed Hamam on 18/01/2023.
//
//

import Foundation
import CoreData


extension TVsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TVsEntity> {
        return NSFetchRequest<TVsEntity>(entityName: "TVsEntity")
    }

    @NSManaged public var image: String?
    @NSManaged public var title: String?

}
