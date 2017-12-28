//
//  ApiService.swift
//  ContactsApp
//
//  Created by mac on 27.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation


class ApiService{
    
    static func loadContacts(){
        
        let context = DatabaseController.context

        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {

                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                guard let jsonObject = jsonResult as? [String:AnyObject] else{ return }
                
                
                if let states = jsonObject["states"] as? [[String:AnyObject]]{
                    _ = states.map({stateDictionary in
                         State(context: context, dictionary: stateDictionary)
                    })
                }
                
                if let cities = jsonObject["cities"] as? [[String:AnyObject]]{
                    _ = cities.map({cityDictionary in
                         City(context: context, dictionary: cityDictionary)
                    })
                }
                
                if let contacts = jsonObject["contacts"] as? [[String:AnyObject]]{
                    _ = contacts.map({contactDictionary in
                        Contact(context: context, dictionary: contactDictionary)
                    })
                }
                
                DatabaseController.saveContext()
                
            } catch {
                // handle error
            }
        }
        
    }
    
}
