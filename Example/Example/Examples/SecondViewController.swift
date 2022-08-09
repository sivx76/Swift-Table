//
//  SecondViewController.swift
//  Table
//
//  Created by Ben Alemu on 8/8/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var table = Table<Person>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
                

        // Build data
        let personOne = Person(name: "Paul", age: 24, imageSource: "person.circle.fill")
        let personTwo = Person(name: "Zhao", age: 31, imageSource: "shareplay")
        let personThree = Person(name: "Maria", age: 28, imageSource: "eye.fill")
        let personFour = Person(name: "Vincent", age: 43, imageSource: "brain")

        
    
        // Form table
        self.table = Table(reuseIdentifier: "id",
                                         data: [personOne, personTwo, personThree, personFour] ,
                                         frame: view.frame)
        { indexPath, element, cell in
            print("Tapped on element: \(element)")
            cell.addCheckmark()
        }
        
        
        // Show TableView
        let tableView = table.show()
        view.addSubview(tableView)

        
        
        // Customize appearance
        table.setHeader(title: "Hello world!")
        table.setCellHeight(height: 50)
        table.setAccessory(style: .disclosureIndicator)

        table.setTitleFont(font: .boldSystemFont(ofSize: 18))

        table.setSubtitleFont(font: .italicSystemFont(ofSize: 14))
        table.setSubtitleColor(color: .brown)

        table.setImageTint(color: .red)

    }
    

}


