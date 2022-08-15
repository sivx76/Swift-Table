//
//  Table.swift
//  Table
//
//  Created by Benyam Alemu Sood on 8/6/22.
//

import UIKit


// MARK: - Documentation Compiler (DocC)
/// A  UITableView that uses Generics to display data that conforms to the ``TableData`` protocol.
/// 
///  Build and display TableView in 3 lines of code.
///
///  No need to conform to UITableViewDelegate and UITableViewDataSource protocols.
///
///  Conform your custom Struct or Class to the TableData protocol.
///
///  
///  ```swift
///  var table = Table(data: ["Krishna", "Thomas", "Jodeci", "Susan"])
///
///
///  override func viewDidLoad() {
///      super.viewDidLoad()
///
///      // Show TableView
///      let tableView = table.show()
///      view.addSubview(tableView)
///
///
///      // Customization
///      table.setHeader(title: "Family")
///      table.setAccessory(style: .disclosureIndicator)
///  }
///  ```
///
///  ```swift
///   let table = Table(reuseIdentifier: "id",
///                     data: ["Krishna", "Thomas", "Jodeci", "Susan"],
///                     frame: view.frame)
///                     {indexPath, element, cell in
///                         print("Tapped on element: \(element)")
///                         cell.addCheckmark()
///                }
///
///   let tableView = table.show()
///
///
///   // Customization
///   table.setHeader(title: "Family!")
///   table.setAccessory(style: .disclosureIndicator)
///
///
///   view.addSubview(tableView)
///  ```


 public class Table<D: TableData>: NSObject, UITableViewDelegate, UITableViewDataSource {
   
    // MARK: - UI Elements
    internal var tableView = UITableView()
    
    
    // MARK: - Variables
    
    /// The data used to show cells for the UITableView.
    ///
    /// Each element produces one UITableViewCell.
    var dataSource = [D]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    /// This multidimensional array produces one TableView Section, for each Array provided.
    var datasets = [[D]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var numberOfSections: Int = 1 {
        didSet {
            tableView.reloadData()
        }
    }

    internal var accessoryTappedAction: (IndexPath, D, UITableViewCell) -> Void = { (index, element, cell) -> Void in
        print("Tapped on accessory of element: \(element)")
    }
    
    // Initialized properties
    internal var identifier = String()
    internal var frame = CGRect()

    internal var cellTappedAction: (IndexPath, D, UITableViewCell) -> Void
    
    
    
    
    // Customize appearance
    internal var title: String? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var titles: [String]? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var titleFont: UIFont = UIFont.systemFont(ofSize: 16) {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var titleColor: UIColor =  .black {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    internal var subtitleFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var subtitleColor: UIColor =  .black {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    internal var imageTint: UIColor =  .systemBlue {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    internal var imageFrame: CGRect =  CGRect(x: 0, y: 0, width: 24, height: 24) {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal  var imageContentMode: UIView.ContentMode = .scaleAspectFit {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    internal var cellHeight: Float = 44.0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var accessory: UITableViewCell.AccessoryType = .none {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var accessoryColor: UIColor = .systemBlue {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Initializers
    /// Builds a placeholder TableView with no initial data.
    convenience override init() {
        let data: [D] = []
        
        self.init(data: data)
    }
    
    
    
    /// Builds a TableView with a specific hard-coded Reuse identifier and a specific Frame.
    convenience init(data: [D]) {
        let generatedIdentifier: String = "ABCD"
        
        self.init(reuseIdentifier: generatedIdentifier, data: data)
    }
    
    
    /// Builds a TableView with a specific hard-coded Reuse identifier and a specific Frame.
    convenience init(datasets: [[D]]) {
        let generatedIdentifier: String = "ABCD"
        
        self.init(reuseIdentifier: generatedIdentifier, datasets: datasets)
    }
    
    
    
    
    
    /// Builds a TableView with a frame of width 400 pixels and height of 800 pixels.
    convenience init(reuseIdentifier: String, data: [D]) {
        let emptyFrame: CGRect = CGRect(x: 0, y: 20, width: 400, height: 800)
        
        self.init(reuseIdentifier: reuseIdentifier, data: data, frame: emptyFrame)
    }
    
    /// Builds a TableView with a specific hard-coded Reuse identifier and a specific Frame.
    convenience init(reuseIdentifier: String, datasets: [[D]]) {
        let emptyFrame: CGRect = CGRect(x: 0, y: 20, width: 400, height: 800)
        
        self.init(reuseIdentifier: reuseIdentifier, datasets: datasets, frame: emptyFrame)
    }
    
    
    
    /// Builds a TableView with a specific cellTappedAction() called when each cell is tapped.*
    required init(reuseIdentifier: String, data: [D], frame: CGRect) {
        self.cellTappedAction = { (index, element, cell) -> Void in
            print("Tapped on element: \(element)")
        }
        
        super.init()
        
        self.identifier = reuseIdentifier
        self.dataSource = data
        self.frame = frame
        
        registerCell()
        configureDelegates()
        
        tableView.frame = frame
    }
    
    
    /// Builds a TableView with a specific cellTappedAction() called when each cell is tapped.*
    required init(reuseIdentifier: String, datasets: [[D]], frame: CGRect) {
        self.cellTappedAction = { (index, element, cell) -> Void in
            print("Tapped on element: \(element)")
        }
        
        super.init()
        
        self.identifier = reuseIdentifier
        self.datasets = datasets
        self.frame = frame
        
        registerCell()
        configureDelegates()
        
        tableView.frame = frame
          
        self.numberOfSections = datasets.count
    }
    
    
    /// Builds a TableView with the provided closure called when we tap on each cell.
    convenience init(reuseIdentifier: String, data: [D], frame: CGRect, action: @escaping (IndexPath, D, UITableViewCell) -> Void) {
        self.init(reuseIdentifier: reuseIdentifier, data: data, frame: frame)
        
        self.cellTappedAction = action
    }
    
    
    /// Builds a TableView with the provided closure called when we tap on each cell.
    convenience init(reuseIdentifier: String, datasets: [[D]], frame: CGRect, action: @escaping (IndexPath, D, UITableViewCell) -> Void) {
        self.init(reuseIdentifier: reuseIdentifier, datasets: datasets, frame: frame)
        
        self.cellTappedAction = action
    }
    
    
    
    
    // MARK: - Helper methods
    private func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    private func configureDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func determineElement(for indexPath: IndexPath) -> D? {
        var element: D? = nil
        
        if numberOfSections > 1 {
            let section = indexPath.section
            
            let array: [D] = datasets[section]
            element = array[indexPath.row]
        } else {
            element = dataSource[indexPath.row]
        }
        
        return element
    }
    
    
    
    
    // MARK: - Tableview methods
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberOfSections > 1 {
            guard let elements = datasets[safe: section] else { return 0 }
            return elements.count
        } else {
            return dataSource.count
        }
    }
    
     public func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
     public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if numberOfSections > 1 {
            guard let title = titles?[safe: section] else { return "Other" }
            return title
        } else {
            return title 
        }
    }
    
    
    
     public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        
        // Determine element
        guard let element: D = determineElement(for: indexPath) else { return UITableViewCell() }
        
        
        // Customize appearance
        cell.textLabel?.text = element.title
        cell.textLabel?.font = titleFont
        cell.textLabel?.textColor = titleColor
        
        
        cell.detailTextLabel?.text = element.subtitle ?? nil
        cell.detailTextLabel?.font = subtitleFont
        cell.detailTextLabel?.textColor = subtitleColor
        
        
        cell.imageView?.image = element.image ?? nil
        cell.imageView?.frame = imageFrame
        cell.imageView?.contentMode = imageContentMode
        cell.imageView?.tintColor = imageTint
        
        cell.accessoryType = accessory
        cell.tintColor = accessoryColor
        
        return cell
    }
    
    
     public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
    
     public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Determine element
        guard let element: D = determineElement(for: indexPath) else { return }
        
        let indexPath: IndexPath = indexPath
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        cellTappedAction(indexPath, element, cell)
    }
    
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let element: D = determineElement(for: indexPath) else { return }
        
        let indexPath: IndexPath = indexPath
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        accessoryTappedAction(indexPath, element, cell)
    }
}
