import SwiftUI
import Firebase
import FirebaseDatabase

class PublishViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
   
    var refStory = Database.database().reference()
    var emailArray = [Any]()
    var otherC = 0
    
   
    let titleTxt = UITextField(frame: CGRect(x: 25, y: 188, width: UIScreen.main.bounds.width - 50, height: 40))
    let authorTxt = UITextField(frame: CGRect(x: 25, y: 236, width: UIScreen.main.bounds.width - 50, height: 40))
    let writeTxt = UITextView(frame: CGRect(x: 25, y: 284, width: UIScreen.main.bounds.width - 50, height: 230))
    let writeTxtNational = UITextView(frame: CGRect(x: 25, y: 562, width: UIScreen.main.bounds.width - 50, height: 230))
    let writeTxtWorld = UITextView(frame: CGRect(x: 25, y: 840, width: UIScreen.main.bounds.width - 50, height: 230))
    let emailTxt = UITextField(frame: CGRect(x: 25, y: 1118, width: UIScreen.main.bounds.width - 50, height: 40))
    let pubLabel = UILabel()
    let publishButton = UIButton()

    
    var scrollView: UIScrollView!
    var contentView = UIView()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseApp.app() == nil{
            FirebaseApp.configure()}
        priorEmail()
        
        
    // self delegates
        titleTxt.delegate = self
        authorTxt.delegate = self
        writeTxt.delegate = self
        emailTxt.delegate = self
        writeTxtNational.delegate = self
        writeTxtWorld.delegate = self
    
    // frame publish label
        pubLabel.frame = CGRect(x: 0, y: 0, width: 365, height: 60)
        pubLabel.center = CGPoint(x: UIScreen.main.bounds.maxX / 2 , y: UIScreen.main.bounds.maxY / 7)
        pubLabel.textAlignment = .center
        pubLabel.text = "Publish"
        pubLabel.font = UIFont(name: "Avenir-Medium", size: 60)
        configText()
        
        
    // back button
        let con = UIImage.SymbolConfiguration(pointSize: 25)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: con)
           
        
        let backButton = UIButton()
        backButton.setImage(image, for: .normal)
        backButton.frame = CGRect(x: 9, y: 40, width: 40, height: 40)
        backButton.tintColor = .black
        backButton.addTarget(self, action:#selector(self.buttonTapped), for: .touchUpInside)
    
    // scrollview
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1400)
        self.scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(scrollView)
        
        contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.addSubview(titleTxt)
        contentView.addSubview(authorTxt)
        contentView.addSubview(emailTxt)
        contentView.addSubview(writeTxt)
        contentView.addSubview(writeTxtNational)
        contentView.addSubview(writeTxtWorld)
        contentView.addSubview(pubLabel)
        contentView.addSubview(backButton)
        contentView.addSubview(publishButton)
        contentView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)

        // publish button
        publishButton.setTitle("Publish", for: .normal)
        publishButton.backgroundColor = #colorLiteral(red: 1, green: 0.7490196078, blue: 0, alpha: 1)
        publishButton.layer.cornerRadius = 50
        publishButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
        publishButton.translatesAutoresizingMaskIntoConstraints = false
        publishButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        publishButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        publishButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        publishButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1205).isActive = true
        publishButton.addTarget(self, action:#selector(self.buttonTappedPub), for: .touchUpInside)
        
        
    }
    // end of viewDidLoad
    
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()

            scrollView.frame = view.bounds
            contentView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        }
    
    
    
    
    
    func configText(){
        // set border colors
            let borderColor : UIColor = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.0)
            writeTxt.layer.borderWidth = 2
            writeTxt.layer.borderColor = borderColor.cgColor
            writeTxt.layer.cornerRadius = 15
            
            writeTxtNational.layer.borderWidth = 2
            writeTxtNational.layer.borderColor = borderColor.cgColor
            writeTxtNational.layer.cornerRadius = 15
            
            writeTxtWorld.layer.borderWidth = 2
            writeTxtWorld.layer.borderColor = borderColor.cgColor
            writeTxtWorld.layer.cornerRadius = 15
            
            titleTxt.layer.borderWidth = 2
            titleTxt.layer.borderColor = borderColor.cgColor
            titleTxt.layer.cornerRadius = 15
            
            authorTxt.layer.borderWidth = 2
            authorTxt.layer.borderColor = borderColor.cgColor
            authorTxt.layer.cornerRadius = 15
            
            emailTxt.layer.borderWidth = 2
            emailTxt.layer.borderColor = borderColor.cgColor
            emailTxt.layer.cornerRadius = 15
            
        
        // font
            titleTxt.font = UIFont(name: "Helvetica Neue", size: 20)
            authorTxt.font = UIFont(name: "Helvetica Neue", size: 20)
            emailTxt.font = UIFont(name: "Helvetica Neue", size: 20)
            writeTxt.font = UIFont(name: "Helvetica Neue", size: 20)
            writeTxtWorld.font = UIFont(name: "Helvetica Neue", size: 20)
            writeTxtNational.font = UIFont(name: "Helvetica Neue", size: 20)
        
        // background colors
            writeTxt.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
            writeTxtNational.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        writeTxtWorld.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        
    }
    
    
    
    
    
    @objc private func buttonTapped(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    

    func backAction() -> Void {
                self.navigationController?.popViewController(animated: true)
            }
    
    
    
     func priorEmail(){
        refStory.child("SpreadSheet").observe(.childAdded) { [self] (snapshot) in
            let value = snapshot.value as? NSDictionary
            let value1 = value?["path-id"] as? String
            emailArray.append(value1)
        }
    }
    
    
    
    
    func addElements(){
        
        
        let storyInfo = ["storyTitle": titleTxt.text! as String?, "storyAuthor": authorTxt.text! as String?, "storyLocal": writeTxt.text! as String?, "storyNational": writeTxtNational.text! as String?, "storyWorld": writeTxtWorld.text! as String?]
        
        let count = emailArray.count
        var i = 0
        while (i < count){
            if emailTxt.text! == emailArray[i] as! String{
                otherC += 1
            }
            i += 1
        }
    
        
        
        if (titleTxt.text!.isEmpty || authorTxt.text!.isEmpty || writeTxt.text!.isEmpty || writeTxtNational.text!.isEmpty || writeTxtWorld.text!.isEmpty || emailTxt.text!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Field(s) Incomplete", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true)
            
        }
        else if(self.otherC == 0){
            let newAlert = UIAlertController(title: "Error", message: "Invalid Author", preferredStyle: UIAlertController.Style.alert)
            newAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(newAlert, animated: true)
            //print("step 3")
        }
        
        else {
            refStory.child("Story").childByAutoId().setValue(storyInfo)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "WeeklyID") as! WeeklyViewController
            self.present(vc, animated: true)
        }
    }
    
    
    
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //for local
        if writeTxt.textColor == UIColor.lightGray {
            writeTxt.text = nil
            writeTxt.textColor = UIColor.black
        }
        
        //repeat for national
         if writeTxtNational.textColor == UIColor.lightGray {
            writeTxtNational.text = nil
            writeTxtNational.textColor = UIColor.black
        }
        
        //repeat for world
        
        if writeTxtWorld.textColor == UIColor.lightGray {
           writeTxtWorld.text = nil
           writeTxtWorld.textColor = UIColor.black
       }
    }

    
    
    
    
    // resign
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTxt.resignFirstResponder()
        authorTxt.resignFirstResponder()
        writeTxt.resignFirstResponder()
        writeTxtNational.resignFirstResponder()
        writeTxtWorld.resignFirstResponder()
        emailTxt.resignFirstResponder()
        return true
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
}
    
    
    
    @IBAction func OutsideKeyboardTapped(_ sender: Any) {
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    }
    
    
    
    
    
    // adds line in textView as input increases
    func adjustUITextViewHeight(arg : UITextView) {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    
    
    
    
    // pass data to Firebase
    @objc private func buttonTappedPub(_ recognizer: UITapGestureRecognizer) {
        
        addElements()
    }

}

