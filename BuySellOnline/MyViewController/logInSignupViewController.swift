
import UIKit
import Firebase
class logInSignupViewController: UIViewController {

    @IBOutlet weak var usernameOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func onClickLoginButton(_ sender: UIButton) {
        if usernameOrEmailTextField.text != "" && passwordTextField.text != "" // when login
        {
            print("requesting Log in...")
            let email = usernameOrEmailTextField.text
            let pass = passwordTextField.text
            Auth.auth().signIn(withEmail: email!, password: pass!, completion: { (user, error) in
                if let error = error{
                    self.showMessagePromt(title: "Error Login", messages: error.localizedDescription )
                }
                else
                {
                    let myApp = MyApp.shared
                    myApp.email = user?.email
                    myApp.userID = user?.uid
                    myApp.username = user?.displayName
                    
                    print(myApp.email)
                    self.performSegue(withIdentifier: "segue_profile", sender: nil)
                    
                    
                }
            })
        }
    }
    @IBAction func onClickSignUp(_ sender: UIButton) {
        
        print("Resquesting Sign up...")
        if (usernameOrEmailTextField.text != "")&&(passwordTextField.text != "")
        {
            let email = usernameOrEmailTextField.text
            let pass = passwordTextField.text
            Auth.auth().createUser(withEmail: email!, password: pass!, completion: { (user, error) in
                
                if let error = error {
                    self.showMessagePromt(title: "Information", messages: error.localizedDescription)
                    return
                }
                print("\(user!.email!) created")
                self.showMessagePromt(title: email!, messages: "Successfully sign up")
                // [END_EXCLUDE]
                
                
            })
        }
        else
        {
            // when leave blank on email or passwor field
            showMessagePromt(title: "Information", messages: "Cannot leave blank!!")
        }
    }
    
    func showMessagePromt(title:String, messages:String){
        let popupDialog = UIAlertController(title: title, message: messages, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        popupDialog.addAction(okAction)
        self.present(popupDialog, animated: true, completion: nil)
    }
    
}
