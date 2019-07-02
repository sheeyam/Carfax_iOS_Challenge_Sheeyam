//
//  VehicleCell.swift
//  Carfax_iOS_Challenge_Sheeyam
//
//  Created by Sheeyam Shellvacumar on 6/30/19.
//  Copyright © 2019 Sheeyam Shellvacumar. All rights reserved.
//

import UIKit

class VehicleCell: UITableViewCell {

    @IBOutlet weak var VehicleYear: UILabel!
    @IBOutlet weak var VehicleMake: UILabel!
    @IBOutlet weak var VehicleModel: UILabel!
    @IBOutlet weak var VehiclePrice: UILabel!
    @IBOutlet weak var VehicleMileage: UILabel!
    @IBOutlet weak var VehicleLocation: UILabel!
    @IBOutlet weak var VehicleDealerContact: UIButton!
    @IBOutlet weak var vehicleImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func makeCallToDealer(_ sender: Any) {
        let dealerNumber = VehicleDealerContact.titleLabel
        guard let number = URL(string: "tel://\(String(describing: dealerNumber))") else { return }
        UIApplication.shared.open(number)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(vehicleData: Vehicles) {
        
        self.VehicleYear.text = "\(vehicleData.vehicleYear)"
        self.VehicleMake.text = "\(vehicleData.vehicleMake)"
        self.VehicleModel.text = "\(vehicleData.vehicleModel)"
        self.VehiclePrice.text = "$\(vehicleData.vehicleListPrice)"
        self.VehicleMileage.text = "\(vehicleData.vehicleMileage) Miles"
        self.VehicleLocation.text = "\(vehicleData.vehicleLocationCity), \(vehicleData.vehicleLocationState)"
        self.VehicleDealerContact.setTitle("\(vehicleData.dealerPhone)", for: .normal)
        
        // Load Vehicle Image
        do {
            let url = URL(string: "\(vehicleData.vehicleImage)1/640x480")
            let data = try Data(contentsOf: (url)!)
            self.vehicleImageview.image = UIImage(data: data)
        }
        catch {
            print(error)
        }
    }
}
