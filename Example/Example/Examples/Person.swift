//
//  Person.swift
//  Table
//
//  Created by Ben Alemu on 8/8/22.
//

import UIKit

struct Person {
    let name: String
    let age: Int
    let imageSource: String
}

extension Person: TableData {
    var title: String {
        return name
    }
    
    var subtitle: String? {
        return "\(age)"
    }
    
    var image: UIImage? {
        return UIImage(systemName: imageSource) ?? nil
    }
    
}
