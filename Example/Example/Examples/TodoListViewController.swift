//
//  TodoListViewController.swift
//  Example
//
//  Created by Benyam Alemu Sood on 8/13/22.
//

import UIKit

class TodoListViewController: UIViewController {
    
    var table = Table<Todo>()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datasets: [[Todo]] = [
            [
                Todo(name: "Grab groceries", description: "Vegetables and dairy", imageSource: "bag.fill"),
                Todo(name: "Drive to airport", description: "Fly to New York", imageSource: "airplane.departure")
            ],
            [
                Todo(name: "Fill up on gas", description: "", imageSource: "fuelpump.fill"),
            ],
            [
                Todo(name: "Homework", description: "Chemistry", imageSource: "book.fill"),
                Todo(name: "Plan birthday", description: "Maria's 15th", imageSource: "heart.fill"),
                Todo(name: "Fix bathroom", description: "Unit #111", imageSource: "wrench.fill")
            ]
        ]

        self.table = Table(reuseIdentifier: "id",
                           datasets: datasets,
                           frame: view.frame,
                           action: { indexPath, element, cell in
            cell.addCheckmark()
        })
        
        
        // Show
        let tableView = table.show()
        view.addSubview(tableView)
        
        // Customization
        table.setHeader(titles: ["Normal", "Urgent", "Completed"])
        table.setImageTint(color: .red)
        table.setCellHeight(height: 60)
        table.setAccessoryColor(color: .purple)

    }
    
}



