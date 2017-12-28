//
//  ContactTableViewCell.swift
//  ContactsApp
//
//  Created by mac on 28.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    func setup(vm: ContactViewModel) {
        self.textLabel?.text = vm.fullName
    }
}
