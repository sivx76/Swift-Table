//
//  Extensions.swift
//  Table
//
//  Created by Ben Alemu on 8/6/22.
//

import UIKit


// MARK: - Conforming to TableData
extension String: TableData {
     var title: String {
        get {
            self
        }
    }


    var subtitle: String? {
        get {
            nil
        }
    }
    
    
    var image: UIImage? {
        get {
            nil
        }
    }
}


extension Int: TableData {
     var title: String {
        get {
            "\(self)"
        }
    }


    var subtitle: String? {
        get {
            nil
        }
    }
    
    
    var image: UIImage? {
        get {
            nil
        }
    }
}



// MARK: - Utilities
extension UITableViewCell {
    func addCheckmark() {
        let cell = self
        
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
    }
}


extension UIViewController {
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:  .cancel, handler: nil  ))
        present(alert, animated: true)
    }
}

// To prevent Index out of Error issues with working with multiple Sections and fetching Table Headers
extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
