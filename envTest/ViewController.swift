//
//  ViewController.swift
//  envTest
//
//  Created by Suren Poghosyan on 18.12.23.
//

#if DEVELOPMENT
    let environment = "Development"
#elseif STAGING
    let environment = "Staging"
#elseif PRODUCTION
    let environment = "Production"
#else
    let environment = "Unknown"
#endif


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: environment, ofType: "plist") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    let plistData = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
                    if let dict = plistData as? [String: Any] {
                        // Access Plist data here
                        if let name = dict["color"] as? String {
                            print("Color: \(name)")
                        }
                    }
                } catch {
                    print("Error reading Plist: \(error)")
                }
            }
        }
        
        switch environment {
            
        case "Development":
            view.backgroundColor = .gray
        case "Production":
            view.backgroundColor = .green
        default:
            view.backgroundColor = .black
        }
    }


}

