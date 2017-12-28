//
//  DatabaseController.swift
//  ContactsApp
//
//  Created by mac on 27.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit


class DatabaseController{
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    static func saveContext () {
        let context = DatabaseController.context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
