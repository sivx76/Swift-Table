//
//  TableData.swift
//  Table
//
//  Created by Benyam Alemu Sood on 8/6/22.
//

import UIKit


/// The protocol used to make a Struct or Class be inserted into the  ``Table/Table/dataSource`` of ``Table/Table``.
 public protocol TableData {
    var title: String { get }
    var subtitle: String? { get }
    var image: UIImage? { get }
}

