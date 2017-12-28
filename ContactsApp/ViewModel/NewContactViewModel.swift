//
//  NewContactViewModel.swift
//  ContactsApp
//
//  Created by mac on 28.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation


class NewContactViewModel{
    
    public var firstName:String = ""
    public var lastName:String = ""
    public var phoneNumber:String = ""
    public var streetAddress1:String = ""
    public var streetAddress2:String = ""
    public var cityID:String = ""
    public var shouldUpdateCities:(([CityViewModel])->())?
    var contact:Contact?
    
    var stateID:String = ""{
        didSet{
           let cities = CitiesService.getCitiesByStateID(context: DatabaseController.context, uiidString: stateID)
            if shouldUpdateCities != nil {
                shouldUpdateCities!(cities.map({CityViewModel(city: $0)}))
            }
        }
    }
    
    init() {}
    
    convenience init(contact:Contact){
        self.init()
        self.firstName = contact.firstName ?? ""
        self.lastName = contact.lastName ?? ""
        self.phoneNumber = contact.phoneNumber ?? ""
        self.streetAddress1 = contact.streetAddress1 ?? ""
        self.streetAddress2 = contact.streetAddress2 ?? ""
        self.cityID = contact.city?.id?.uuidString ?? ""
        self.stateID = contact.state?.id?.uuidString ?? ""
        
        self.contact = contact
    }
    
    
    var city:City?{
        return CitiesService.getByUIID(context: DatabaseController.context, uiidString: cityID)
    }
    var state:State?{
        return StatesService.getByUIID(context: DatabaseController.context, uiidString: stateID)
    }
    
    enum SaveStatus{
        case success
        case failed
    }
    
    
    func saveModel(completion:(SaveStatus)->()){
        let success = ContactsService.createNewContact(context: DatabaseController.context, vm: self)
        DatabaseController.saveContext()
        if success{
            completion(.success)
        }
        else{
            completion(.failed)
        }
    }
    
    func updateModel(completion:(SaveStatus)->()){
        let success = ContactsService.updateContact(context: DatabaseController.context, vm: self)
        DatabaseController.saveContext()
        if success{
            completion(.success)
        }
        else{
            completion(.failed)
        }
    }
    
    
    class CityViewModel{
        var city:City
        var id:String?{
            return self.city.id?.uuidString
        }
        var title:String?{
            return self.city.title
        }
        init(city:City) {
            self.city = city
        }
    }
    
    class StateViewModel{
        var state:State
        var title:String?{
            return self.state.title
        }
        var id:String?{
            return self.state.id?.uuidString
        }
        init(state:State) {
            self.state = state
        }
    }
    
    
    
}


