//
//  ContactsViewController.swift
//  ContactsApp
//
//  Created by mac on 27.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import CoreData

class ContactsViewController: UIViewController {

    @IBOutlet weak var contactsTableView: UITableView!
    
    var data:[ContactViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactViewModel.cellIdentifier)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NewContactViewController{
            vc.delegate = self
            vc.statesData = StatesService.getStates(context: DatabaseController.context).map({
                NewContactViewModel.StateViewModel(state: $0)
            })
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

extension ContactsViewController:UpdatesContactsList{
    func update() {
        data = ContactsService.getContacts(context: DatabaseController.context).map({
            ContactViewModel(contact: $0)
        })
        contactsTableView.reloadData()
    }
}


extension ContactsViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return data[indexPath.row].cellInstance(tableView, indexPath: indexPath)
    }
}

extension ContactsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = ContactsViewController.instantiateFromSuperclassStoryboard()
        controller.viewModel = NewContactViewModel(contact: data[indexPath.row].contact)
        controller.statesData = StatesService.getStates(context: DatabaseController.context).map({
            NewContactViewModel.StateViewModel(state: $0)
        })
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    class func instantiateFromSuperclassStoryboard() -> DetailsContactViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "newContactVC")
        object_setClass(controller, DetailsContactViewController.self)
        return controller as! DetailsContactViewController
    }
    
}




