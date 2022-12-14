# Swift Table

The fastest and easiest way to present a UITableView - **in 3 lines of code**.

Powered by Generics to present any data type. 

No need to use the UITableViewDelegate and UITableViewDataSource protocols. 

Swift Table is a free and open-source library that removes the hundreds of lines of code you need to create a fully-customized TableView.

![Image examples of three TableViews](https://github.com/sivx76/Swift-Table/blob/main/Other/Screenshots/Collection.png)



## Example:
``` swift
var table = Table(data: ["Adam", "Juan", "Kate", "Siddharth", "Mary", "Zhao"])
let tableView = table.show()
view.addSubview(tableView)
```


That is all you need!


## Another example:
``` swift
let table = Table(reuseIdentifier: “id”,
                  data: [“Krishna”, “Thomas”, “Jaimie”, “Susan”],
                  frame: view.frame)
                  {indexPath, element, cell in
                       print(“Tapped on element: \(element)”)
                        cell.addCheckmark()
              }

let tableView = table.show()

// Customization
table.setHeader(title: “Family!”)
table.setAccessory(style: .disclosureIndicator)
```


## Features:
* Supports single and multiple sections of data
* Can show a subtitle and image label for each cell
* Provide your own action triggered when a cell is tapped
* Over 30 public methods to customize most aspects of TableViews - headers, cellHeight, accessories, fonts, colors and much more
* Includes support for Documentation Compiler (DocC) to show code documentation and tips as you type
* Supports Swift Package Manager (SPM) and Cocoapods dependency managers.


## Benefits:
* Reduce the hundreds of lines of codes you use for TableViews
* Save dozens of hours of development time
* Prevent confusing errors



## Quick tips:
* If you want to show a TableView with one section, insert one array into the **data** parameter or call the .setData() method. If you want to show a TableView with multiple sections, insert a multidimensional array into the **datasets** parameter or call the .setDatasets() method.
* To perform any changes, try using the  public methods on the Table class. For example: `table.setCellHeight(54.0)` or `table.setTitleColor(color: .blue)`
* If your desired change is not in our public methods, try using `table.addStyle()` - which allows you to customize the TableView and its cells, indexPath and elements directly
* To present your own custom class or struct, conform to the **`TableData`** protocol.
* Open the Example folder to see an Xcode Project showing how to use Swift Table.
* Current issue: if a TableView is not shown, make sure the Table variable is a global variable (outside of viewDidLoad or any other function) - for reference, see the Example project.


## Installation:
* For Swift Package Manager, `Add the Package` using this Git link and select the main branch: https://github.com/sivx76/Swift-Table.git
* For Cocoapods, add this dependency:  `pod 'Tables'`


## Public methods:

Data:
* append(element: D)
* insert(element: D, at index: Int)
* insert(element: D, at index: Int, datasetIndex: Int)
* removeElement(at index: Int)
* removeElement(at index: Int, datasetIndex: Int)
* randomElement() -> D?
* setData(data: [D])
* setDatasets(datasets: [[D]])
* shuffleElements()
* removeAllElements()


Appearance:
* setTitleFont(font: UIFont)
* setTitleColor(color: UIColor)
* setSubtitleFont(font: UIFont)
* setSubtitleColor(color: UIColor)
* setImageTint(color: UIColor)
* setImageFrame(frame: CGRect)
* setImageContentMode(contentMode: UIView.ContentMode)
* setHeader(title: String)
* setHeader(titles: [String])
* setHeaderView(view: UIView)
* setFooterView(view: UIView)
* setAccessory(style: UITableViewCell.AccessoryType)
* setAccessoryColor(color: UIColor)
* setCellHeight(height: Float)
* setSeparatorColor(color: UIColor)
* setSeparatorInset(edgeInsets: UIEdgeInsets)
* setKeyboardDismiss(mode: UIScrollView.KeyboardDismissMode)
* setAction(action: @escaping (IndexPath, D, UITableViewCell)
* setAccessoryAction(action: @escaping (IndexPath, D, UITableViewCell) -> Void)
* addStyle(style: @escaping (UITableView, IndexPath, D, UITableViewCell) -> Void)
* clearStyles()


Access TableView:
* show() -> UITableView
* hide()
* setFrame(frame: CGRect)
* showFrame() -> CGRect


## Created by:
Benyam Alemu Sood and Jigyasaa Alemu Sood, 2022.

Swift Table is a free and opensource library distributed under the **MIT License**. You may use the source code for free in any of our personal and commercial libraries. 

If you would like to, you may create any articles, tutorials or videos describing any component of this library.

Swift Table will always be free to use and openly available.

If this project helps you, consider donating! [Sponsor us here](https://github.com/sponsors/sivx76) to support new innovations for iOS Developers


## Collaboration:
We are in active development. We welcome collaboration.

Feel free to send any pull requests or proposed changes to our codebase. Submit your ideas and code improvements.

