//
//  DetailsContactViewController.swift
//  ContactsApp
//
//  Created by mac on 28.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit


class DetailsContactViewController:NewContactViewController{
    
    
    
    override func viewDidLoad() {
        

        viewModel.shouldUpdateCities = {[unowned self] citiesModels in
            self.citiesData = citiesModels
        }
        
        viewModel.stateID = viewModel.stateID
        
        let selectedStateIndex = statesData.index { (model) -> Bool in
            model.id == viewModel.stateID
        }

        if let index = selectedStateIndex {
            statePickerView.selectRow(index, inComponent: 0, animated: true)
        }

        let selectedCityIndex = citiesData.index { (model) -> Bool in
            model.id == viewModel.cityID
        }
        
        if let index = selectedCityIndex {
            cityPickerView.selectRow(index, inComponent: 0, animated: true)
        }
        
        
        firstNameTextField.text = viewModel.firstName
        lastNameTextField.text = viewModel.lastName
        phoneNumberTextField.text = viewModel.phoneNumber
        streetAddress1TextField.text = viewModel.streetAddress1
        streetAddress2TextField.text = viewModel.streetAddress2
        
        saveButton.title = "Update"
    }
    
    override func saveContactPressed(_ sender: Any) {
        viewModel.updateModel { (status) in
            switch status{
            case .success:
                delegate?.update()
                print("success")
            case .failed:
                print("failed")
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    
}
