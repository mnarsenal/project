//
//  Loginvc.swift
//  Find seat
//
//  Created by MR9U2 on 6/22/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit
import CoreData
class Loginvc: UIViewController {

    @IBOutlet weak var viewlogin: UIView!
    @IBOutlet weak var btlogin: UIButton!
    @IBOutlet weak var gglogin: UIView!
    @IBOutlet weak var fblogin: UIView!
    
    @IBOutlet var tapView: UITapGestureRecognizer!
    
    
    @IBOutlet weak var bottomLoginShowKeybroard: NSLayoutConstraint!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var isShowingKeybroad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewlogin.layer.cornerRadius = 10
        btlogin.layer.cornerRadius = 10
        gglogin.layer.cornerRadius = 10
        fblogin.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
        // Do any additional setup after loading the view.
    
        @objc func keyboardWillShow(notification: NSNotification) {
                
            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
               // if keyboard size is not available for some reason, dont do anything
               return
            }
            
          // active bottomLoginConstraints
            if !isShowingKeybroad {
                self.bottomLoginShowKeybroard.constant = keyboardSize.height + 10
                          self.bottomLoginShowKeybroard.isActive = true
                          self.view.layoutIfNeeded()
            }
            isShowingKeybroad = true
        }
        
        @objc func keyboardWillHide(notification: NSNotification) {
          // move back the root view origin to zero
            if isShowingKeybroad {
                self.bottomLoginShowKeybroard.isActive = false
                self.view.layoutIfNeeded()
            }
          isShowingKeybroad = false
        }

        func dismissKey()
        {
            tapView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapView.cancelsTouchesInView = false; self.view.addGestureRecognizer(tapView)
        }
        @objc func dismissKeyboard()
        {
            self.view.endEditing(true)
        }
    
    func retrieveData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let converstationKeyPredicate = NSPredicate(format: "username = %@", usernameTextField.text as! CVarArg)
        let messageKeyPredicate = NSPredicate(format: "password = %@", passwordTextField.text as! CVarArg)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [converstationKeyPredicate, messageKeyPredicate])
        fetchRequest.predicate = andPredicate
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                let user = data.value(forKey: "username") as! String
                let pass = data.value(forKey: "password") as! String
                if usernameTextField.text == user {
                    if passwordTextField.text == pass{
                    let MainScr = storyboard?.instantiateViewController(withIdentifier: "abb") as! MainScreenVC
                        MainScr.modalPresentationStyle = .fullScreen
                        present(MainScr, animated: true, completion: nil)
                    }
                    else{
                       let alert = UIAlertController(title: "sai", message: nil, preferredStyle: UIAlertController.Style.alert)
                         alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                        present(alert, animated: true,completion: nil)
                    }
                }
                else{
                    let alert = UIAlertController(title: "saiiii", message: nil, preferredStyle: UIAlertController.Style.alert)
                     alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    present(alert, animated: true,completion: nil)
                }
            }
        }catch{
            print("failed")
        }
    }
    @IBAction func btLogin(_ sender: Any) {
        retrieveData()
        
//        self.view.endEditing(true)
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        let phoneRegEx = "/(03|07|08|09|01[2|6|8|9])+([0-9]{8})\\b$"
//        let result = usernameTextField.text?.range(of: emailRegEx, options:.regularExpression)
//        let result1 = usernameTextField.text?.range(of: phoneRegEx, options:.regularExpression)
//        if(usernameTextField.text?.count == 0){
//            let alert = UIAlertController(title: "illegal", message: nil, preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            present(alert, animated: true,completion: nil)
//        }
//        if result == nil && (result1 == nil) {
//            let alert = UIAlertController(title: "illegal", message: nil, preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            present(alert, animated: true,completion: nil)
//
//        }else {
//            if(passwordTextField.text!.count >= 6){
//                let MainScr = storyboard?.instantiateViewController(withIdentifier: "abb") as! MainScreenVC
//                MainScr.modalPresentationStyle = .fullScreen
//                present(MainScr, animated: true, completion: nil)
//            }
//            else{
//                let alert = UIAlertController(title: "illegal", message: nil, preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//                    present(alert, animated: true,completion: nil)
//            }
//        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
