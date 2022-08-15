//
//  WeatherViewController.swift
//  Example
//
//  Created by Benyam Alemu Sood on 8/13/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var table = Table<Weather>()
    
    let data: [Weather] = [
        Weather(name: "Clear", description: "83 degress Fahrenheit", imageSource: "smoke"),
        Weather(name: "Sunny", description: "85 degress Fahrenheit", imageSource: "sun.max"),
        Weather(name: "Light showers", description: "60 degress Fahrenheit", imageSource: "cloud.drizzle"),
        Weather(name: "Windy", description: "68 degress Fahrenheit", imageSource: "wind"),
        
        Weather(name: "Thunderstorm", description: "44 degress Fahrenheit", imageSource: "bolt.circle"),
        Weather(name: "Snowing", description: "21 degress Fahrenheit", imageSource: "snowflake"),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Show table
        self.table = Table(reuseIdentifier: "weatherTable",
                           data: data,
                           frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 600)
        )
        
        
        let tableView = table.show()
        view.addSubview(tableView)
        
        
        // Customization
        table.setHeader(title: "Weather")
        table.setCellHeight(height: 55)
        
        table.setTitleFont(font: .boldSystemFont(ofSize: 16))
        

        table.setSubtitleFont(font: .systemFont(ofSize: 12))
        table.setSubtitleColor(color: .systemTeal)
        
        
        table.setAccessory(style: .detailButton)
        table.setAccessoryAction { indexPath, element, cell in
            print("Loading more info about - \(element)")
        }
    }

}
