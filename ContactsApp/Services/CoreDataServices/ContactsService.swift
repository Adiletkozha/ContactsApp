//
//  ContactsService.swift
//  ContactsApp
//
//  Created by mac on 27.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation
import CoreData


class ContactsService{
    
    static func getContacts(context:NSManagedObjectContext)->[Contact]{
        let request:NSFetchRequest<Contact> = Contact.fetchRequest()
        do{
            let result = try context.fetch(request)
            return result
        }catch {
            fatalError()
        }
    }
    
}
