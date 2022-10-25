import UIKit

class ArticleViewController: UIViewController {
    
    var model = Story(author: "", title: "", local: "", national: "", world: "")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeArticle()
        
    }
    
    private func makeArticle() {
        
        //scroll setup
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1)
        
        //back button
        let con = UIImage.SymbolConfiguration(pointSize: 25)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: con)
        
        let backButton = UIButton()
        contentView.addSubview(backButton)
        backButton.setImage(image, for: .normal)
        backButton.tintColor = .black
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8).isActive = true
        backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.addTarget(self, action:#selector(self.buttonTapped), for: .touchUpInside)
         
        //title format
        let titleLabel = UILabel()
        titleLabel.text = model.title
        titleLabel.font = UIFont(name: "Georgia", size: 35)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 70).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        //author format
        let authorLabel = UILabel()
        authorLabel.text = model.author
        authorLabel.font = UIFont(name: "Georgia", size: 16)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(authorLabel)
        authorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        authorLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 130).isActive = true
        authorLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //local discriptive label
        let d1Label = UILabel()
        d1Label.text = "Local News"
        d1Label.font = UIFont(name: "Georgia", size: 20)
        d1Label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(d1Label)
        d1Label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        d1Label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 160).isActive = true
        d1Label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        d1Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
         
        //local format
        let localLabel = UILabel()
        localLabel.text = model.local
        localLabel.font = UIFont(name: "Georgia", size: 18)
        localLabel.numberOfLines = 0
        localLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(localLabel)
        localLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        localLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 210).isActive = true
        localLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        
        //national discriptive label
        let d2Label = UILabel()
        d2Label.text = "National News"
        d2Label.font = UIFont(name: "Georgia", size: 20)
        d2Label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(d2Label)
        d2Label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        let temp3 = d2Label.topAnchor.constraint(equalTo: localLabel.bottomAnchor)
        temp3.constant += 4
        temp3.isActive = true
        d2Label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        d2Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        //national format
        let nationalLabel = UILabel()
        nationalLabel.text = model.national
        nationalLabel.font = UIFont(name: "Georgia", size: 18)
        nationalLabel.numberOfLines = 0
        nationalLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nationalLabel)
        let temp = nationalLabel.topAnchor.constraint(equalTo: d2Label.bottomAnchor)
        temp.constant += 4
        temp.isActive = true
        nationalLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        nationalLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        
        //world discriptive label
        let d3Label = UILabel()
        d3Label.text = "Global News"
        d3Label.font = UIFont(name: "Georgia", size: 20)
        d3Label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(d3Label)
        d3Label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        let some = d3Label.topAnchor.constraint(equalTo: nationalLabel.bottomAnchor)
        some.constant += 4
        some.isActive = true
        d3Label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        d3Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        //world format
        let worldLabel = UILabel()
        worldLabel.text = model.world
        worldLabel.font = UIFont(name: "Georgia", size: 18)
        worldLabel.numberOfLines = 0
        worldLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(worldLabel)
        let temp1 = worldLabel.topAnchor.constraint(equalTo: d3Label.bottomAnchor)
        temp1.constant += 4
        temp1.isActive = true
        worldLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        worldLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        worldLabel.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor).isActive = true
        
        
    }
    
    @objc func buttonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

