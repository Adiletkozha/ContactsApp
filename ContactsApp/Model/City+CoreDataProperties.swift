//
//  City+CoreDataProperties.swift
//  ContactsApp
//
//  Created by mac on 27.12.17.
//  Copyright © 2017 mac. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var state: State?

}
