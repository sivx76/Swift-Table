//
//  SecondViewController.swift
//  Table
//
//  Created by Ben Alemu on 8/8/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var table = Table<String>(datasets: [
        ["San Diego", "Hawaii", "Paris", "Buenos Aires"],
        ["Swim", "Run", "Eat", "Play"],
        ["Drive", "Fly"]
    ])
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        // Show TableView
        let tableView = table.show()
        view.addSubview(tableView)

        
        // Customize appearance
        table.setHeader(titles: ["Locations", "Activities", "Travel"])
    }
    

}


