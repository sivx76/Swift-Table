//
//  ContactListViewController.swift
//  Example
//
//  Created by Benyam Alemu Sood on 8/13/22.
//

import UIKit

class ContactListViewController: UIViewController {
    
    let table = Table(data: ["Adam", "Juan", "Kate", "Siddharth", "Mary", "Zhao"])


    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Creating table
        let tableView = table.show()
        view.addSubview(tableView)
        
        
        // Customization
        table.setHeader(title: "Contacts")
        table.setAccessory(style: .disclosureIndicator)
                
        table.setAction { indexPath, element, cell in
            self.showAlert(title: "Sending call", message: "Calling \(element) ...")
        }
        
        
        // Most flexible of the public methods
        table.addStyle { tableView, indexPath, element, cell in
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .systemTeal
                cell.accessoryType = .detailDisclosureButton
            }
        }
        
        table.addStyle { tableView, indexPath, element, cell in
            if indexPath.row % 2 == 1 {
                cell.textLabel?.textColor = .red
            }
        }
        
        
        
                
        
    }
    


}
