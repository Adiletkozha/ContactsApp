//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by mac on 28.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

protocol UpdatesContactsList {
    func update()
}


class NewContactViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var streetAddress1TextField: UITextField!
    @IBOutlet weak var streetAddress2TextField: UITextField!
    @IBOutlet weak var statePickerView: UIPickerView!
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var viewModel:NewContactViewModel = NewContactViewModel()

    var delegate:UpdatesContactsList?
    var statesData:[NewContactViewModel.StateViewModel] = []{
        didSet{
            if statePickerView != nil{
                statePickerView.reloadAllComponents()
            }
        }
    }
    
    var citiesData:[NewContactViewModel.CityViewModel] = []{
        didSet{
            cityPickerView.reloadAllComponents()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel.shouldUpdateCities = {[unowned self] citiesModels in
            self.citiesData = citiesModels
        }
        
        if let stateId = statesData[statePickerView.selectedRow(inComponent: 0)].id {
            viewModel.stateID = stateId
        }
        
        if let cityId = statesData[cityPickerView.selectedRow(inComponent: 0)].id {
            viewModel.cityID = cityId
        }
        

    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == firstNameTextField {
            viewModel.firstName = firstNameTextField.text!
        }
        if textField == lastNameTextField{
            viewModel.lastName = lastNameTextField.text!
        }
        if textField == phoneNumberTextField{
            viewModel.phoneNumber = phoneNumberTextField.text!
        }
        if textField == streetAddress1TextField{
            viewModel.streetAddress1 = streetAddress1TextField.text!
        }
        if textField == streetAddress2TextField{
            viewModel.streetAddress2 = streetAddress2TextField.text!
        }
        
        return true
    }

    @IBAction func saveContactPressed(_ sender: Any) {
        viewModel.saveModel { (status) in
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
    
    @IBAction func dismissPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}




