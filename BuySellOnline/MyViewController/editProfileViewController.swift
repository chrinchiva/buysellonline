
import UIKit
import Firebase

class editProfileViewController: UIViewController {
    @IBOutlet weak var changeUsernameTextField: UITextField!
   
    @IBOutlet weak var changePasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onClickButtonChange(_ sender: UIButton) {
        //******** change username *********************************
        if Auth.auth().currentUser != nil {
            //showMessagePromt(title: "Current user is:", messages: MyApp.shared.email)
            
            if changeUsernameTextField.text != ""
            {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = changeUsernameTextField.text
                changeRequest?.commitChanges(completion: { (error) in
                    if let error = error
                    {
                    self.showMessagePromt(title: "Error Login", messages: error.localizedDescription )
                    }
                    else
                    {
                        self.showMessagePromt(title: "Information", messages: "Success changed" )
                    }
                })
            }
            //******** change password and do verification *********************************
            if (changePasswordTextField.text != "")
            {
                Auth.auth().currentUser?.updatePassword(to: changePasswordTextField.text!, completion: { (error) in
                    if let error = error
                    {
                        self.showMessagePromt(title: "Error password", messages: error.localizedDescription)
                    }
                    else
                    {
                        let user = Auth.auth().currentUser
                        if let user = user {
                            // The user's ID, unique to the Firebase project.
                            // Do NOT use this value to authenticate with your backend server,
                            // if you have one. Use getTokenWithCompletion:completion: instead.
                            let email = user.email
                            Auth.auth().sendPasswordReset(withEmail: email!, completion: { (error) in
                                
                            })
                        }
                        
                    }
                })
            }
            
            //******** change profile picture *********************************
            
            
        } else {
            showMessagePromt(title: "Information", messages: "Please log in first!!")
        }
        let user = Auth.auth().currentUser
        if let user = user {
            let myApp  = MyApp.shared
            myApp.username = user.displayName
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showMessagePromt(title:String, messages:String){
        let popupDialog = UIAlertController(title: title, message: messages, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        popupDialog.addAction(okAction)
        self.present(popupDialog, animated: true, completion: nil)
    }


}
