//
//  TitleTableViewCell.swift
//  WeatherApp
//
//  Created by Deniz Adil on 9/30/20.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblWeatherDesc: UILabel!
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
        lblTemp.isHidden = false
        lblWeatherDesc.isHidden = false
    }
    
    func setWeatherInfoForCity(city: City) {
        self.lblName.text = city.name
        startLoading()
        APIManager.shared.getWeatherForCIty(id: city.id) { (weather, error) in
            if let weather = weather {
                self.stopLoading()
                self.lblTemp.text = "\(weather.main.temp!)°"
                self.lblWeatherDesc.text = weather.weather[0].description?.capitalized
                if let iconName = weather.weather[0].icon {
                 let imageUrl = BASE_ICON_URL + iconName + "@2x.png"
                    self.icon.kf.setImage(with: URL(string: imageUrl))
                }
            }
        }
    }
    
}
