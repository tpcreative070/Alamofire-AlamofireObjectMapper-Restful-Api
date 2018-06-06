//
//  ViewController.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/4/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var lbWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "Home Page"
        self.navigationItem.setHidesBackButton(true, animated:true);
        let user = ShareReferences.shared.getUser()
        lbWelcome.text  = "Hi " + (user.name?.uppercased())! + " Welcome To TPCreative"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnLogout(_ sender: UIButton) {
       self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

