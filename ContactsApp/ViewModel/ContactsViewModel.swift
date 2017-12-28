//
//  ContactsViewModel.swift
//  ContactsApp
//
//  Created by mac on 27.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ContactViewModel{
    static let cellIdentifier = "ContactCell"
    
    var fullName:String{
        guard let firstName = contact.firstName , let lastName = contact.lastName else{ return "" }
        return firstName + " " + lastName
    }
    
    var contact:Contact
    
    init(contact:Contact){
        self.contact = contact
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactViewModel.cellIdentifier, for: indexPath) as! ContactTableViewCell
        cell.setup(vm: self)
        return cell
    }
    
}
