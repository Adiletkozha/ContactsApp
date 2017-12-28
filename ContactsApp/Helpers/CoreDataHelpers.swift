//
//  CoreDataHelpers.swift
//  ContactsApp
//
//  Created by mac on 28.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import CoreData


class CoreDataHelpers{
    
    static func runRequest<T: NSManagedObject>(context:NSManagedObjectContext,request:NSFetchRequest<T>)->[T]{
        do{
            let result = try context.fetch(request)
            return result
        }
        catch{
            fatalError()
        }
    }
}
