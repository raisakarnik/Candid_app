import UIKit

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        welcome()
        
        let viewButton = UIButton()
        viewButton.setTitle("View Articles", for: .normal)
        viewButton.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.01960784314, blue: 0.4705882353, alpha: 1)
        viewButton.layer.cornerRadius = 50
        viewButton.titleLabel?.font = UIFont(name: "Avenir", size: 30)
        view.addSubview(viewButton)
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true
        viewButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.maxY - 320).isActive = true
        viewButton.addTarget(self, action:#selector(self.buttonTappedView), for: .touchUpInside)
        
        let pubButton = UIButton()
        pubButton.setTitle("Publish Story", for: .normal)
        pubButton.backgroundColor = #colorLiteral(red: 1, green: 0.7490196078, blue: 0, alpha: 1)
        pubButton.layer.cornerRadius = 50
        pubButton.titleLabel?.font = UIFont(name: "Avenir", size: 30)
        view.addSubview(pubButton)
        pubButton.translatesAutoresizingMaskIntoConstraints = false
        pubButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true
        pubButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        pubButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pubButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.maxY - 200).isActive = true
        pubButton.addTarget(self, action:#selector(self.buttonTappedPub), for: .touchUpInside)
        

    }
    
    
    
    
    @objc func buttonTappedView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "WeeklyID") as! WeeklyViewController
        self.present(vc, animated: true)
        
    }
    
    
    
    
    
    
    @objc func buttonTappedPub(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "PubID") as! PublishViewController
        self.present(vc, animated: true)
        
    }
    
    
    
    
    
    func welcome(){
        let welc = UILabel()
        view.addSubview(welc)
        welc.text = "Welcome"
        welc.font = UIFont(name: "Georgia", size: 80)
        welc.textAlignment = .center
        welc.translatesAutoresizingMaskIntoConstraints = false
        welc.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        welc.heightAnchor.constraint(equalToConstant: 100).isActive = true
        welc.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        welc.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.minY + 320).isActive = true
    }
}
    
    

