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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        presentSearchAlertController(withTitle: "Enter city namr", message: nil, style: .alert) { [unowned self] city in
            <#code#>
        }

    }

}

