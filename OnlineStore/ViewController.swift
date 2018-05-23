//
//  ViewController.swift
//  OnlineStore
//
//  Created by Apple's on 17/04/18.
//  Copyright © 2018 Aadil. All rights reserved.
//

import UIKit
//import CoreData


class ViewController: UIViewController {
    
var rows = [Items]()
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var quantityTF: UITextField!
    @IBOutlet weak var costTF: UITextField!
    @IBOutlet var popUp: UIVisualEffectView!
    
    @IBAction func okpress(_ sender: Any) {
        popUp.removeFromSuperview()
        }
    
  
    @IBAction func checkOut(_ sender: Any) {
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDel.persistentContainer.viewContext
        do{
            rows = try context.fetch(Items.fetchRequest())
           print("COUNT",rows.count)
            for item in rows {
                print("\(item.name ?? " ") : \(item.quantity ?? " ") : \(item.cost) ")
            }  
        }catch{
            print("Nothing to FETCH")
            
        }
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as!  ViewController2
        vc.rows1 = rows
       
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func savepress(_ sender: Any) {
        if nameTF.text == "" || quantityTF.text == "" || costTF.text == ""
        {
        popUp.center = self.view.center
        self.view.addSubview(popUp)
        }
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let item = Items(context: context)
        item.name = nameTF.text ?? " "
        item.quantity = quantityTF.text ?? " "
        let a = Int(costTF.text!)
        let b = Int(quantityTF.text!)
        
        if a != nil && b != nil {
           let c = a! * b!
            item.cost = Int32(c)
        }
            appDel.saveContext()
            nameTF.text = ""
            quantityTF.text = ""
            costTF.text = ""
        
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

