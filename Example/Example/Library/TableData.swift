//
//  TableData.swift
//  Table
//
//  Created by Ben Alemu on 8/6/22.
//

import UIKit


/// The protocol used to make a Struct or Class be inserted into the  ``Example_Project/Table/dataSource`` of ``Example_Project/Table``.
protocol TableData {
    var title: String { get }
    var subtitle: String? { get }
    var image: UIImage? { get }
}

