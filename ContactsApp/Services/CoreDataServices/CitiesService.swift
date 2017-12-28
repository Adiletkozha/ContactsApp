//
//  CitiesService.swift
//  ContactsApp
//
//  Created by mac on 27.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation
import CoreData

class CitiesService{
    
    static func getByUIID(context:NSManagedObjectContext,uiidString:String)->City?{
        let request:NSFetchRequest<City> = City.fetchRequest()
        do{
            let predicate = NSPredicate(format: "id = %@", UUID(uuidString:  uiidString)! as CVarArg)
            request.predicate = predicate
            let result = try context.fetch(request)
            return result.first
        }
        catch{
            fatalError()
        }
    }
    
}
