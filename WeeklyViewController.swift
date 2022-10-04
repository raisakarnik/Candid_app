//
//  LocalViewController.swift
//  News
//
//  Created by Raisa Karnik on 7/26/21.
//

import UIKit
import Firebase
import FirebaseDatabase

struct Story {
    let author: String
    let title: String
    let local: String
    let national: String
    let world: String
}

class WeeklyViewController: UIViewController{
   
    private var stories = [Story]()
    let backButton = UIButton()
    private let ref = Database.database().reference()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(WeeklyTableViewCell.self, forCellReuseIdentifier: WeeklyTableViewCell.identifier)
        return table
    }()
    
    //Load in func
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupTableView()
        getAllStories()
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        tableView.tableFooterView = UIView()
        
        
        //back button
        let con = UIImage.SymbolConfiguration(pointSize: 25)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: con)
           
        
        //let backButton = UIButton()
        backButton.setImage(image, for: .normal)
        backButton.frame = CGRect(x: 9, y: 0, width: 40, height: 40)
        backButton.tintColor = .black
        backButton.addTarget(self, action:#selector(self.buttonTapped), for: .touchUpInside)
        //self.tableView.addSubview(backButton)
        
        
    }
    
    
    @objc func buttonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // access from database

    private func getAllStories(){
        ref.child("Story").observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let author1 = snapshotValue["storyAuthor"]!
            let title1 = snapshotValue["storyTitle"]!
            let local1 = snapshotValue["storyLocal"]!
            let national1 = snapshotValue["storyNational"]!
            let world1 = snapshotValue["storyWorld"]!
            
            let ex = Story(author: author1, title: title1, local: local1, national: national1, world: world1)
            self.stories.append(ex)
            self.tableView.reloadData()
        }
    }
    
    public enum DatabaseError: Error{
        case failedToFetch
    }
    
}


extension WeeklyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.stories.count
    }
    

    
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

// i dunno bout this chief
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
        headerView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)

        headerView.addSubview(backButton)
        return headerView
    }
    
    
    
    
    
    
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let model = self.stories[indexPath.row]
       
        let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyTableViewCell.identifier, for: indexPath) as! WeeklyTableViewCell
        cell.configure(with: model)
        
        cell.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        //cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        /*cell.layer.shadowOffset = CGSize(width: -2,height: 7)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.25
        cell.layer.masksToBounds = false;
        cell.clipsToBounds = false;*/
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var model = self.stories[indexPath.row]
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "myVCID") as! ArticleViewController
        
        vc.model = model
        self.present(vc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
}



    













