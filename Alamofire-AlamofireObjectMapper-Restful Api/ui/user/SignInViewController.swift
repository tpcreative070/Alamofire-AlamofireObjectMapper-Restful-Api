//
//  SignInViewController.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/5/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var viewProgress: UIActivityIndicatorView!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    let presenter  = UserPresenter(userService : UserAPI() )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SignIn Page"
        self.textFieldEmail.delegate = self
        self.textFieldPassword.delegate = self
        presenter.attachView(view: self)
        viewProgress.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSignUp(_ sender: UIButton) {
        print("Action")
        Navigator.onMoveToSignUp(view: self)
    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        if !(textFieldEmail.text?.isEmpty)!  && !(textFieldPassword.text?.isEmpty)! {
            let user = UserRequest(name : "null" , email : textFieldEmail.text! , password : textFieldPassword.text!)
            startLoading()
            presenter.onSignIn(request: user)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.isNavigationBarHidden = true
        self.textFieldEmail.text = ""
        self.textFieldPassword.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        //navigationController?.isNavigationBarHidden = false
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension SignInViewController : UserView {
    
    func startLoading() {
        viewProgress.isHidden = false
    }
    
    func stopLoading() {
        viewProgress.isHidden = true
    }
    
    func signInSuccessful(message: String) {
        print(message)
        dialog(message: message, error: false)
    }
    
    func signUpSuccessful(message: String) {
        print(message)
        dialog(message: message, error: false)
    }
    
    func errorOccurred(message: String) {
        print(message)
        dialog(message: message, error: true)
    }
    
    func dialog(message : String, error: Bool){
        let uiAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        self.present(uiAlert, animated: true, completion: nil)
        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            if !error {
                Navigator.onMoveToHome(view: self)
            }
        }))
    }
    
    
}
