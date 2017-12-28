//
//  NewContactPickerViewHelper.swift
//  ContactsApp
//
//  Created by mac on 28.12.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit


extension NewContactViewController:UIPickerViewDataSource,UIPickerViewDelegate{
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == statePickerView {
            return statesData.count
        }
        else{
            return citiesData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == statePickerView{
            return statesData[row].title
        }
        else{
            return citiesData[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == statePickerView {
            guard let uuid = statesData[row].id else { return }
           
            viewModel.stateID = uuid
            cityPickerView.reloadAllComponents()
            
            if let cityID =  citiesData[cityPickerView.selectedRow(inComponent: 0)].id{
                viewModel.cityID = cityID
            }
        }
        else{
            guard let uuid = citiesData[row].id else { return }
            viewModel.cityID =  uuid
        }
    }
    
    
    
    
    
}

