//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Deniz Adil on 10/7/20.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblLattLong: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func startLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        lblCityName.isHidden = false
        lblCountryName.isHidden = false
        lblState.isHidden = false
        lblLattLong.isHidden = false
    }
    func setWeatherInfo(city: City) {
        lblCityName.text = city.name
        lblCountryName.text = city.country
        lblState.text = city.state
        if let coord = city.coord, let latt = coord.lat, let long = coord.lon {
            lblLattLong.text = "(\(latt.round(to: 3)), \(long.round(to: 3)))"
        } else {
            lblLattLong.text = ""
        }
        stopLoading()
    }
}
extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
