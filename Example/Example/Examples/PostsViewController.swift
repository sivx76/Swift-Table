//
//  PostsViewController.swift
//  Example
//
//  Created by Benyam Alemu Sood on 8/13/22.
//

import UIKit

class PostsViewController: UIViewController {
    
    
    var table = Table<Post>()
    
    let data: [Post] = [
        Post(name: "Posted by Michael", description: "6 minutes ago", imageSource: "media.hike"),
        Post(name: "Posted by Sonya", description: "3 hours ago", imageSource: "media.beach"),
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Show table
        self.table = Table(reuseIdentifier: "postTable",
                           data: data,
                           frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        )
        
        
        let tableView = table.show()
        view.addSubview(tableView)
        
        
        // Customization
        table.setHeader(title: "Feed")
        table.setAccessory(style: .disclosureIndicator)
        
        table.subtitleColor = .gray
        table.setCellHeight(height: 240)
        
        table.setImageContentMode(contentMode: .scaleAspectFill)
    }
    


}
