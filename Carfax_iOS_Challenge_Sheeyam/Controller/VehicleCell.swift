//
//  VehicleCell.swift
//  Carfax_iOS_Challenge_Sheeyam
//
//  Created by Sheeyam Shellvacumar on 6/30/19.
//  Copyright © 2019 Sheeyam Shellvacumar. All rights reserved.
//

import UIKit

class VehicleCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var VehicleYearMakeModel: UILabel!
    @IBOutlet weak var VehiclePriceMileageLocation: UILabel!
    @IBOutlet weak var VehicleDealerContact: UIButton!
    @IBOutlet weak var vehicleImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // Make Call to the Dealer
    @IBAction func makeCallToDealer(_ sender: Any) {
        let dealerNumberStr = VehicleDealerContact.titleLabel?.text
        let dealerNumber = dealerNumberStr?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard let number = URL(string: "tel://\(dealerNumber!)") else { return }
        UIApplication.shared.open(number)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Configure Vehicle Cell
    func configureCell(vehicleData: Vehicle) {
        // Vehicle - Year | Make | Model | trim
        var trim = " "
        if vehicleData.vehicleTrim.lowercased() != "unspecified" {
            trim = "| \(vehicleData.vehicleTrim)"
        }
        self.VehicleYearMakeModel.text = "\(vehicleData.vehicleYear) \(vehicleData.vehicleMake) \(vehicleData.vehicleModel) \(trim)"
        
        // vehicle - Price | Location | mileage Details
        let boldListPriceText  = "$\(ListPriceFormatter(price: vehicleData.vehicleListPrice))"
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string:boldListPriceText, attributes:attrs)
        
        let normalMileageLocationText = " | \(formatNumber(vehicleData.vehicleMileage)) Mi | \(vehicleData.vehicleLocationCity), \(vehicleData.vehicleLocationState)"
        let normalMileageLocationString = NSMutableAttributedString(string:normalMileageLocationText)
        
        attributedString.append(normalMileageLocationString)
        self.VehiclePriceMileageLocation.attributedText = attributedString
        
        // Dealer Phone No Text
        let dealerPhoneNo = PhoneNumberFormatter(phoneNumber: "\(vehicleData.dealerPhone)")
        self.VehicleDealerContact.setTitle("\(dealerPhoneNo!)", for: .normal)
        
        // Load Vehicle Image
        do {
            let url = URL(string: "\(vehicleData.vehicleImage)1/640x480")
            let data = try Data(contentsOf: (url)!)
            self.vehicleImageview.image = UIImage(data: data)
        } catch {
            print(error)
        }
    }
}
