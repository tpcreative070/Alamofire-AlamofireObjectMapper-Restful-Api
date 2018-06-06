//
//  SignUpViewController.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/5/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var viewProgress: UIActivityIndicatorView!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    let presenter = UserPresenter(userService : UserAPI())
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SignUp Page"
        customBackButton()
        self.textFieldName.delegate = self
        self.textFieldEmail.delegate = self
        self.textFieldPassword.delegate = self
        viewProgress.isHidden = true
        presenter.attachView(view: self)

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSignIn(_ sender: UIButton) {
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        
        if !(textFieldName.text?.isEmpty)! && !(textFieldEmail.text?.isEmpty)!  && !(textFieldPassword.text?.isEmpty)! {
            let user = UserRequest(name : textFieldName.text! , email : textFieldEmail.text! , password : textFieldPassword.text!)
            startLoading()
            presenter.onSignUp(request: user)
        }
        
    }
    
    func customBackButton() {
        let backImage = UIImage(named: "sharp_arrow_back_white_48pt")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(self.backBtnClicked))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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


extension SignUpViewController : UserView {
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
                 self.navigationController?.popViewController(animated: true)
            }
        }))
    }
    
}
