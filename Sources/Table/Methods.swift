//
//  Methods.swift
//  Example
//
//  Created by Benyam Alemu Sood on 8/11/22.
//

import UIKit

 extension Table {
    
    // MARK: - Public methods - Data
    
    /// Add an Element to the end of our ``dataSource``.
    public func append(element: D) {
        self.dataSource.append(element)
    }
    
    /// Inserts an element at a specific position into our ``dataSource``
    public func insert(element: D, at index: Int) {
        if index < self.dataSource.count {
            self.dataSource.insert(element, at: index)
        } else {
            print("ERROR: Index too large for dataSource - out of range")
        }
    }
    
    /// Inserts an element at a specific position into our ``datasets``
    public func insert(element: D, at index: Int, datasetIndex: Int) {
        if (index < self.datasets.count) && (datasetIndex < self.datasets[index].count) {
            self.datasets[datasetIndex].insert(element, at: index)
        } else {
            print("ERROR: Index or datasetIndex too large for datasets - out of range")
        }
    }

    /// Removes an element from the ``dataSource``
    public func removeElement(at index: Int) {
        if index < self.dataSource.count {
            self.dataSource.remove(at: index)
        } else {
            print("ERROR: Index too large for dataSource - out of range")
        }
    }
    
    /// Removes an element from  ``datasets``
    public func removeElement(at index: Int, datasetIndex: Int) {
        if (index < self.datasets.count) && (datasetIndex < self.datasets[index].count) {
            self.datasets[datasetIndex].remove(at: index)
        } else {
            print("ERROR: Index or datasetIndex too large for datasets - out of range")
        }
    }
    
    /// Returns a random element from ``dataSource``
    public func randomElement() -> D? {
        return self.dataSource.randomElement()
    }
    
    /// Replace our ``dataSource`` with a new Array.
    public func setData(data: [D]) {
        self.dataSource = data
        self.numberOfSections = 1
    }
    
    /// Replace our ``datasets`` with a new multidimensional Array.
    public func setDatasets(datasets multipleSections: [[D]]) {
        self.datasets = multipleSections
        self.numberOfSections = datasets.count
    }
    
    /// Randomize all the elements in our ``dataSource`` and ``datasets``.
    public func shuffleElements() {
        self.dataSource.shuffle()
        self.datasets.shuffle()
    }
    
    /// Removes all elements from the ``dataSource`` and ``datasets``.
    public func removeAllElements() {
        self.dataSource.removeAll()
        self.datasets.removeAll()
    }
        
    
    
    
    // MARK: - Public methods - Appearance
     
     /// Set a custom style to be applied for only a particular element(s) or at a given indexPaths
     public func addStyle(style: @escaping (UITableView, IndexPath, D, UITableViewCell) -> Void) {
         self.appliedStyles.append(style)
     }
     
     
     /// Removes all styles previously set
     public func clearStyles() {
         self.appliedStyles = [(UITableView, IndexPath, D, UITableViewCell) -> Void]()
     }

    /// Change the font of titleLabel.
    public func setTitleFont(font: UIFont) {
        self.titleFont = font
    }
    
    /// Change the color of the titleLabel.
    public func setTitleColor(color: UIColor) {
        self.titleColor = color
    }
    
    /// Change the font of the detailTextLabel.
    public func setSubtitleFont(font: UIFont) {
        self.subtitleFont = font
    }
    
    /// Change the color of the detailTextLabel.
    public func setSubtitleColor(color: UIColor) {
        self.subtitleColor = color
    }
    
    /// Change the color of system-defined Images in our imageView.
    public func setImageTint(color: UIColor) {
        self.imageTint = color
    }
    
    
    /// Change the size of the image shown by the cell
    public func setImageFrame(frame: CGRect) {
        self.imageFrame = frame
    }
    
    /// Change how the image of the imageLabel is displayed
    public func setImageContentMode(contentMode: UIView.ContentMode) {
        self.imageContentMode = contentMode
    }
    
    
    /// Change the Title shown on the top of the TableView.
    public func setHeader(title: String) {
        self.title = title
    }
    
    /// Provide the Titles that will be shown for each Section of the TableView.
    public func setHeader(titles: [String]) {
        self.titles = titles
    }
    
    /// Add a View pinned to the top of the TableView
    public func setHeaderView(view: UIView) {
        self.tableView.tableHeaderView = view
    }
    
    /// Add a View pinned to the bottom of the TableView
    public func setFooterView(view: UIView) {
        self.tableView.tableFooterView = view
    }
    
    /// Change the default accessory shown for each cell.
    public func setAccessory(style: UITableViewCell.AccessoryType) {
        self.accessory = style
    }
    
    
    /// Change the color used by the accessory
    public func setAccessoryColor(color: UIColor) {
        self.accessoryColor = color
    }
    
    /// Change the height for each row.
    public func setCellHeight(height: Float) {
        self.cellHeight = height
    }
    
    /// Change the color of the separator between each UITableViewCell
    public func setSeparatorColor(color: UIColor) {
        tableView.separatorColor = color
    }
    
    /// Move the separator between each UITableViewCell
    public func setSeparatorInset(edgeInsets: UIEdgeInsets) {
        tableView.separatorInset = edgeInsets
    }
    
    /// Allow the keyboard to be removed from the TableView
    public func setKeyboardDismiss(mode: UIScrollView.KeyboardDismissMode) {
        tableView.keyboardDismissMode = mode
    }
    
    /// Change the closure called when each cell is tapped.
    public func setAction(action: @escaping (IndexPath, D, UITableViewCell) -> Void) {
        self.cellTappedAction = action
    }
    
    
    /// Change the closure called when the accesory of each cell is tapped.
    public func setAccessoryAction(action: @escaping (IndexPath, D, UITableViewCell) -> Void) {
        self.accessoryTappedAction = action
    }
    
    
    // MARK: - Public methods - Access View
    
    /// Outputs the TableView generated by the ``Table`` class.
    ///
    /// - Returns: The UITableView created by the Table.
    public func show() -> UITableView {
        tableView.isHidden = false
        return tableView
    }
    
    /// Hide the TableView from the View.
    public func hide() {
        tableView.isHidden = true
    }
    
    /// Change the Frame or dimensions of the TableView.
    ///
    ///  - Parameter frame: Changes the x and y-position, width and height of the TableView.
    public func setFrame(frame: CGRect) {
        self.frame = frame
        tableView.frame = frame
    }
    
    /// Outputs the frame of the TableView.
    ///
    ///  - Returns: A rectangle showing the x and y-position, width and height of the TableView.
    public func showFrame() -> CGRect {
        return frame
    }
    
}
