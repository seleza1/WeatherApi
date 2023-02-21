//
//  ViewController.swift
//  WeatherApi
//
//  Created by user on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    var networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.stopAnimating()

        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterface(weather: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        activityIndicator.startAnimating()
        presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            networkWeatherManager.fetchCurrentWeather(forCity: city)
            activityIndicator.stopAnimating()
        }
    }

    private func updateInterface(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

