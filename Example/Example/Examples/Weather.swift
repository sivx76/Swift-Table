//
//  Weather.swift
//  Example
//
//  Created by Benyam Alemu Sood on 8/13/22.
//

import Foundation

import UIKit

struct Weather {
    let name: String
    let description: String
    let imageSource: String
}


extension Weather: TableData {
    var title: String {
        return self.name
    }
    
    var subtitle: String? {
        return self.description
    }
    
    var image: UIImage? {
        return UIImage(systemName: imageSource) ?? nil

    }
    
    var accessory: UITableViewCell.AccessoryType? {
        get {
            nil
        }
    }
    
}
