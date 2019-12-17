//
//  ViewController.swift
//  Mvc
//
//  Created by Kvana mac Air 4 on 17/12/19.
//  Copyright © 2019 Kvana mac Air 4. All rights reserved.
//

import UIKit

class UsersData{
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
}

class ViewController: UIViewController {
    var usersArray:[UsersData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }


    func fetchData(){
        NetworkInterface.fetchJSON(.signin, headers: nil, requestCompletionHander: {(success, data, response,error) in
            if success == true, let data = data {
                if ((data.value(forKey: "error")) != nil) {
                    
//                    self.showAlert(status: data["status"] as! NSString)
                    DispatchQueue.main.async {
//                        Opi9ProgressHud.hide(self.view)
                    }
                }else{
                    let users = data["array"] as? [[String:Any]]
                    print(users)
                    self.usersArray.removeAll()
                    for user in users! {
                        let useObj = UsersData()
                        useObj.id = user["email"] as? Int
                        useObj.userId = user["phone"] as? Int
                        useObj.title = user["gender"] as? String
                        useObj.body = user["lastname"] as? String
                       
                        self.usersArray.append(useObj)
                    }
                    
//                 UserSession.sharedSession.createUser(withData: data)
                 DispatchQueue.main.async {
//                 Opi9ProgressHud.hide(self.view)
//                 self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as UIViewController, animated: true)
                 }
                }
            }else{
               print("error")
            }
        })
    }
//    let userData = usersArray[indexPath.row]
}

