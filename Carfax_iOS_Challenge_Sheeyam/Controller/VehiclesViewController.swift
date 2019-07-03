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
    @IBOutlet weak var tableActivityWheel: UIActivityIndicatorView!
    
    // Variables
    var vehicles: Vehicle!
    var vehicleArray = [Vehicle]()
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableActivityWheel.startAnimating()
        
        // Refresh Control
        refreshControl.attributedTitle = NSAttributedString(string: "fetching...")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        if #available(iOS 10.0, *) {
            VehicleTableView.refreshControl = refreshControl
        } else {
            VehicleTableView.addSubview(refreshControl)
        }
        
        // Call Download Function - Service Call
        self.downloadVehicles {
            print("Vehicles Data Downloaded")
            self.tableActivityWheel.stopAnimating()
            self.tableActivityWheel.isHidden = true
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
        return "CARFAX - Technical Assignment - Sheeyam"
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
    
    // Cell Display Animation
    var shownIndexes : [IndexPath] = []
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (shownIndexes.contains(indexPath) == false) {
            shownIndexes.append(indexPath)
            
            cell.transform = CGAffineTransform(translationX: 0, y: 40)
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.alpha = 0
            
            UIView.beginAnimations("rotation", context: nil)
            UIView.setAnimationDuration(0.5)
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            cell.alpha = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            UIView.commitAnimations()
        }
    }
    
    // Function to Download Vehicle Data
    func downloadVehicles(completed: @escaping DownloadCompleteData) {
        Alamofire.request(API_URL).responseJSON { (response) in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String,AnyObject> {
                if let list = dictionary["listings"] as? [Dictionary<String,AnyObject>] {
                    for item in list {
                        let vehicle = Vehicle(vehiclesDict: item)
                        self.vehicleArray.append(vehicle)
                    }
                    self.VehicleTableView.reloadData()
                }
            }
            completed()
        }
    }
    
    // Refresh Data
    @objc func refreshData() {
        self.tableActivityWheel.startAnimating()
        self.downloadVehicles {
            print("Vehicles Data Downloaded")
            self.refreshControl.endRefreshing()
            self.tableActivityWheel.stopAnimating()
            self.tableActivityWheel.isHidden = true
        }
    }
}
