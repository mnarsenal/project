//
//  ViewController.swift
//  Find seat
//
//  Created by MR9U2 on 6/22/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPw: UITextField!
    @IBOutlet weak var tfRPW: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func createData(){
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User" , in: managedContext)
        let user = NSManagedObject(entity: entity!, insertInto: managedContext)
        user.setValue(tfUsername.text, forKey: "username")
        user.setValue(tfPw.text, forKey: "password")
        do {
           try managedContext.save()
          } catch let error as NSError{
            print("Failed saving.\(error),\(error.userInfo)")
        }
    }
  func retrieveData(){
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      let managedContext = appDelegate.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    let converstationKeyPredicate = NSPredicate(format: "username = %@", tfUsername.text!)
    let messageKeyPredicate = NSPredicate(format: "password = %@", tfPw.text!)
      let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [converstationKeyPredicate, messageKeyPredicate])
      fetchRequest.predicate = andPredicate
      do{
          let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
        if result == [] {
                if(tfPw.text!.count >= 6){
                    if (tfRPW.text ?? "") == (tfPw.text ?? ""){
                        createData()
                    let login = storyboard?.instantiateViewController(withIdentifier: "Loginvc") as! Loginvc
                    login.modalPresentationStyle = .fullScreen
                    present(login, animated: true, completion: nil)
                    }
                    else{
                        let alert = UIAlertController(title: "vb", message: nil, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                            present(alert, animated: true,completion: nil)
                    }
                }
                else{
                    let alert = UIAlertController(title: "ko", message: nil, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                        present(alert, animated: true,completion: nil)
                }
              }
              else{
                  let alert = UIAlertController(title: "Tai khoan da ton tai", message: nil, preferredStyle: UIAlertController.Style.alert)
                   alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                  present(alert, animated: true,completion: nil)
              }
          
      }catch{
          print("failed")
      }
  }
    @IBAction func btn_Registration(_ sender: Any) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let phoneRegEx = "/(03|07|08|09|01[2|6|8|9])+([0-9]{8})\\b$"
        let result = tfUsername.text?.range(of: emailRegEx, options:.regularExpression)
        let result1 = tfUsername.text?.range(of: phoneRegEx, options:.regularExpression)
        if result == nil && (result1 == nil) {
            let alert = UIAlertController(title: "sai", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true,completion: nil)
            
        }else {
            retrieveData()
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

