//
//  Extensions.swift
//  Table
//
//  Created by Benyam Alemu Sood on 8/6/22.
//

import UIKit


// MARK: - Conforming to TableData
extension String: TableData {
     public var title: String {
        get {
            self
        }
    }


     public var subtitle: String? {
        get {
            nil
        }
    }
    
    
     public var image: UIImage? {
        get {
            nil
        }
    }
    
    
    public var showCheckmark: Bool? {
        get {
            nil
        }
    }
}


 extension Int: TableData {
     public var title: String {
        get {
            "\(self)"
        }
    }


     public var subtitle: String? {
        get {
            nil
        }
    }
    
    
     public var image: UIImage? {
        get {
            nil
        }
    }
     
     
     public var showCheckmark: Bool? {
         get {
             nil
         }
     }
}



// MARK: - Utilities
public extension UITableViewCell {
    func addCheckmark() {
        let cell = self
        
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
    }
}


public extension UIViewController {
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:  .cancel, handler: nil  ))
        present(alert, animated: true)
    }
}

// To prevent Index out of Error issues with working with multiple Sections and fetching Table Headers
public extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
