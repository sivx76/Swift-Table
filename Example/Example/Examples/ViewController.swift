//
//  ViewController.swift
//  Table
//
//  Created by Ben Alemu on 8/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var table = Table(data: ["Krishna", "Thomas", "Jodeci", "Susan"])


    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Show TableView
        let tableView = table.show()
        view.addSubview(tableView)

        
        
        // Customization
        table.setHeader(title: "Family")
        table.setAccessory(style: .disclosureIndicator)
    }
    

}

