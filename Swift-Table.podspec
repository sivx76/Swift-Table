
Pod::Spec.new do |spec|

  spec.name         = "Swift-Table"
  spec.version      = "1.0"
  spec.summary      = "The fastest and easiest way to present a UITableView - in 3 lines of code."

  spec.description  = "The world's simplest, fastest and most customizable TableView. Create a UITableView in 3 lines of code. Powered by Generics. No need to use Table View protocols. Uses UIKit."

  spec.homepage     = "https://github.com/sivx76/Swift-Table"
  spec.screenshots  = "https://raw.githubusercontent.com/sivx76/Swift-Table/main/Other/Screenshots/Collection.png"


  spec.license      = "MIT"

  spec.author             = { "sivx76" => "sivx76@gmail.com", "jsood6" => "jigyasaasood@gmail.com" }
  spec.social_media_url   = "https://twitter.com/sivx76"



  spec.platform     = :ios, "5.0"

  spec.source       = { :git => "https://github.com/sivx76/Swift-Table.git", :tag => "v1.0" }


  spec.source_files  = "Sources/**/*"

  spec.ios.deployment_target = '11.0'

  spec.swift_version = '5.0'


end
