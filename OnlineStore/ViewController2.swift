//
//  ViewController2.swift
//  OnlineStore
//
//  Created by Apple's on 17/04/18.
//  Copyright © 2018 Aadil. All rights reserved.
//

import UIKit
import CoreData


class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var ff: UITableView!
    var rows1 = [Items]()
    
   
    @IBAction func emptyBtn(_ sender: Any) {
        deleteAllData()
        rows1.removeAll()
        
        ff.reloadData()
    }
    
    
    override func viewDidLoad() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("COUNT",rows1.count)
        for item in rows1 {
            print("\(item.name ?? " ") : \(item.quantity ?? " ") : \(item.cost) ")
        }
        return rows1.count
    }
    
   
    
    
    @IBOutlet weak var title1: UILabel!
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTVC
        cell.nameLbl.text = "\(indexPath.row + 1))  " + rows1[indexPath.row].name!
        cell.quantityLbl.text = rows1[indexPath.row].quantity
        cell.costLbl.text = String(rows1[indexPath.row].cost)
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.persistentContainer.viewContext
            let object = rows1[indexPath.row]
            context.delete(object)
            rows1.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    func deleteAllData() {
       
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        if let result = try? context.fetch(fetchRequest) {
            for object in result {
                context.delete(object as! NSManagedObject)
            }
            appDel.saveContext()
        }
    }
}
