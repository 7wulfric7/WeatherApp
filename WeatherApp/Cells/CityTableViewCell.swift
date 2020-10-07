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
    
    func stopLoading(city: City) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        lblCityName.isHidden = false
        lblCountryName.isHidden = false
        lblState.isHidden = false
        lblLattLong.isHidden = false
    }
    func setWeatherInfo(city: City) {
        self.lblCityName.text = city.name
        self.lblCountryName.text = city.country
        self.lblState.text = city.state
        self.lblLattLong.text = "\(city.coord?.latt), \(city.coord?.long)"
        startLoading()
        }
    }
 
