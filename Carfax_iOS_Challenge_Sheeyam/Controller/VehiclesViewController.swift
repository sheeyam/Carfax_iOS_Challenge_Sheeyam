//
//  VehiclesViewController.swift
//  Carfax_iOS_Challenge_Sheeyam
//
//  Created by Sheeyam Shellvacumar on 6/30/19.
//  Copyright © 2019 Sheeyam Shellvacumar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class VehiclesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var VehicleTableView: UITableView!
    
    // Variables
    var vehicles: Vehicles!
    var vehicleArray = [Vehicles]()
    var vehicle: Vehicle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicle = Vehicle()
        self.downloadVehicles {
            print("Data Downloaded")
        }
    }
    
    // TableView - No of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableView - No of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleArray.count
    }
    
    // Tableview Title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CARFAX - Technical Assignment"
    }
    
    // Cell for Row at Indexpath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            "VehicleCell") as? VehicleCell else {
                return UITableViewCell()
        }
        cell.configureCell(vehicleData: vehicleArray[indexPath.row])
        return cell
    }
    
    // Function to Download Vehicle Data
    func downloadVehicles(completed: @escaping DownloadCompleteData) {
        Alamofire.request(API_URL).responseJSON { (response) in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String,AnyObject> {
                if let list = dictionary["listings"] as? [Dictionary<String,AnyObject>] {
                    for item in list {
                        let vehicle = Vehicles(vehiclesDict: item)
                        self.vehicleArray.append(vehicle)
                    }
                    self.VehicleTableView.reloadData()
                }
            }
            completed()
        }
    }
}
