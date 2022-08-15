//
//  Weather.swift
//  Example
//
//  Created by Benyam Alemu Sood on 8/13/22.
//

import Foundation

import UIKit

struct Post {
    let name: String
    let description: String
    let imageSource: String
}


extension Post: TableData {
    var title: String {
        return self.name
    }
    
    var subtitle: String? {
        return self.description
    }
    
    var image: UIImage? {
        return UIImage(named: imageSource) ?? nil

    }
    
}
