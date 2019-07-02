//
//  Vehicles.swift
//  Carfax_iOS_Challenge_Sheeyam
//
//  Created by Sheeyam Shellvacumar on 7/1/19.
//  Copyright © 2019 Sheeyam Shellvacumar. All rights reserved.
//

import Foundation

class Vehicle {
    
    private var  _vehicleYear: Int!
    private var  _vehicleMake: String!
    private var  _vehicleModel: String!
    private var  _vehicleImage: String!
    private var  _vehicleListPrice: Int!
    private var  _vehicleMileage: Int!
    private var  _vehicleLocationCity: String!
    private var  _vehicleLocationState: String!
    private var  _vehicleTrim: String!
    private var  _dealerPhone: String!
    
    var vehicleYear: Int {
        if _vehicleYear == nil {
            _vehicleYear = 0
        }
        return _vehicleYear
    }
    
    var vehicleMake: String {
        if _vehicleMake == nil {
            _vehicleMake = ""
        }
        return _vehicleMake
    }
    
    var vehicleModel: String {
        if _vehicleModel == nil {
            _vehicleModel = ""
        }
        return _vehicleModel
    }
    
    var vehicleTrim: String {
        if _vehicleTrim == nil {
            _vehicleTrim = ""
        }
        return _vehicleTrim
    }
    
    var vehicleListPrice: Int {
        if _vehicleListPrice == nil {
            _vehicleListPrice = 0
        }
        return _vehicleListPrice
    }
    
    var vehicleMileage: Int {
        if _vehicleMileage == nil {
            _vehicleMileage = 0
        }
        return _vehicleMileage
    }
    
    var vehicleLocationCity: String {
        if _vehicleLocationCity == nil {
            _vehicleLocationCity = ""
        }
        return _vehicleLocationCity
    }
    
    var vehicleLocationState: String {
        if _vehicleLocationState == nil {
            _vehicleLocationState = ""
        }
        return _vehicleLocationState
    }
    
    var dealerPhone: String {
        if _dealerPhone == nil {
            _dealerPhone = ""
        }
        return _dealerPhone
    }
    
    var vehicleImage: String {
        if _vehicleImage == nil {
            _vehicleImage = ""
        }
        return _vehicleImage
    }
    
    init(vehiclesDict: Dictionary<String, AnyObject>) {
        
        if let year = vehiclesDict["year"] as? Int {
            self._vehicleYear = year
        }
        
        if let make = vehiclesDict["make"] as? String {
            self._vehicleMake = make
        }
        
        if let model = vehiclesDict["model"] as? String {
            self._vehicleModel = model
        }
        
        if let trim = vehiclesDict["trim"] as? String {
            self._vehicleTrim = trim
        }
        
        if let listPrice = vehiclesDict["listPrice"] as? Int {
            self._vehicleListPrice = listPrice
        }
        
        if let mileage = vehiclesDict["mileage"] as? Int {
            self._vehicleMileage = mileage
        }
        
        if let dealerCity = vehiclesDict["dealer"]?["city"] as? String {
            self._vehicleLocationCity = dealerCity
        }
        
        if let dealerState = vehiclesDict["dealer"]?["state"] as? String {
            self._vehicleLocationState = dealerState
        }
        
        if let dealerPhone = vehiclesDict["dealer"]?["phone"] as? String {
            self._dealerPhone = dealerPhone
        }
        
        if let vehicleImage = vehiclesDict["images"]?["baseUrl"] as? String {
            self._vehicleImage = vehicleImage
        }
        
    }
    
}
