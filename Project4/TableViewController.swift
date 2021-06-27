//
//  TableViewController.swift
//  Project4
//
//  Created by Андрей Бородкин on 27.06.2021.
//

import UIKit
import WebKit

class TableViewController: UITableViewController, WKNavigationDelegate {

    var websites = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Websites"
        
        if let vc = storyboard?.instantiateViewController(identifier: "Browser") as? ViewController {
            websites += vc.websites
            print(websites)
        }
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
//        if let vc = storyboard?.instantiateViewController(identifier: "Browser") as? ViewController {
//           websites = vc.websites
//        }
        return websites.count
       
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "Browser") as? ViewController {
            
            vc.url = URL(string: "https://" + websites[indexPath.row])!
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
    
    }

}
