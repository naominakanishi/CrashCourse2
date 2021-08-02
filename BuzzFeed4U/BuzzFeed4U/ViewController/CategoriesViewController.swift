import UIKit

class CategoriesViewController: UIViewController {

    let topBlobsImageView = UIImageView()
    let bottomBlobsImageView = UIImageView()
    let homeTitle = UILabel()
    let categoryTitle = UILabel()
    let categoryButtonContainer = UIView()
    let buttonMargin: CGFloat = 15
    lazy var tapAction: (CategoryButton) -> Void = { button in
        QuizManager.shared.selectedStartingCategory = button.category
        guard let image = button.categoryImageView.image,
              let title = button.categoryTitle.text
        else { return }
        self.presentQuizScreen(categoryImage: image, categoryTitle: title)
    }
    
    init () {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupTopBlobs(){
        topBlobsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topBlobsImageView)
        topBlobsImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topBlobsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topBlobsImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func setupBottomBlobs(){
        bottomBlobsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBlobsImageView)
        bottomBlobsImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBlobsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomBlobsImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomBlobsImageView.heightAnchor.constraint(equalTo: bottomBlobsImageView.widthAnchor, multiplier: 374 / 828).isActive = true
    }
    
    
    func displayHomeTitle(){
        let hMargin: CGFloat = 15
        homeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeTitle)
        homeTitle.text = "Com o que o Buzzfeed pode te ajudar hoje?"
        homeTitle.font = UIFont.boldSystemFont(ofSize: 32)
        homeTitle.numberOfLines = 0
        homeTitle.textColor = UIColor(named: "violetColor")
        homeTitle.topAnchor.constraint(equalTo: topBlobsImageView.bottomAnchor).isActive = true
        homeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hMargin).isActive = true
        homeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin).isActive = true

    }
    
    func setupContainer(){
        let margin: CGFloat = 30
//        categoryButtonContainer.backgroundColor = .blue
        categoryButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryButtonContainer)
        categoryButtonContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -margin).isActive = true
        categoryButtonContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin).isActive = true
        categoryButtonContainer.topAnchor.constraint(equalTo: homeTitle.bottomAnchor, constant: margin).isActive = true
        categoryButtonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    
    }
    
    func setupExistentialCrisisButton() {
        //let margin: CGFloat = 15
        let existentialCrisisButton = CategoryButton (category: .existentialCrisis, tapAction: tapAction)
        existentialCrisisButton.configure(imageName: "crazy", categoryTitle: "socorro, tô em crise existencial")
        existentialCrisisButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButtonContainer.addSubview(existentialCrisisButton)
        
        existentialCrisisButton.topAnchor.constraint(equalTo: categoryButtonContainer.topAnchor).isActive = true
        existentialCrisisButton.bottomAnchor.constraint(equalTo: categoryButtonContainer.centerYAnchor, constant: -buttonMargin).isActive = true
        existentialCrisisButton.leadingAnchor.constraint(equalTo: categoryButtonContainer.leadingAnchor).isActive = true
        existentialCrisisButton.trailingAnchor.constraint(equalTo: categoryButtonContainer.centerXAnchor, constant: -buttonMargin).isActive = true
    }
    
    func setupFoodieButton(){
        let foodieButton = CategoryButton (category: .foodie, tapAction: tapAction)
        foodieButton.configure(imageName: "foodie", categoryTitle: "só consigo pensar em comer e beber")
        foodieButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButtonContainer.addSubview(foodieButton)
        
        foodieButton.topAnchor.constraint(equalTo: categoryButtonContainer.topAnchor).isActive = true
        foodieButton.bottomAnchor.constraint(equalTo: categoryButtonContainer.centerYAnchor, constant: -buttonMargin).isActive = true
        foodieButton.leadingAnchor.constraint(equalTo: categoryButtonContainer.centerXAnchor, constant: buttonMargin).isActive = true
        foodieButton.trailingAnchor.constraint(equalTo: categoryButtonContainer.trailingAnchor).isActive = true
    }
    
    func setupLoveButton() {
        let loveButton = CategoryButton (category: .love, tapAction: tapAction)
        loveButton.configure(imageName: "love", categoryTitle: "send help ca vida amorosa")
        loveButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButtonContainer.addSubview(loveButton)
        
        loveButton.topAnchor.constraint(equalTo: categoryButtonContainer.centerYAnchor, constant: buttonMargin).isActive = true
        loveButton.bottomAnchor.constraint(equalTo: categoryButtonContainer.bottomAnchor).isActive = true
        loveButton.leadingAnchor.constraint(equalTo: categoryButtonContainer.leadingAnchor).isActive = true
        loveButton.trailingAnchor.constraint(equalTo: categoryButtonContainer.centerXAnchor, constant: -buttonMargin).isActive = true
        
    }
    
    func setupBoredButton() {
        let boredButton = CategoryButton (category: .bored, tapAction: tapAction)
        boredButton.configure(imageName: "bored", categoryTitle: "num aguento mais o tédio")
        boredButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButtonContainer.addSubview(boredButton)
        
        boredButton.topAnchor.constraint(equalTo: categoryButtonContainer.centerYAnchor, constant: buttonMargin).isActive = true
        boredButton.bottomAnchor.constraint(equalTo: categoryButtonContainer.bottomAnchor).isActive = true
        boredButton.leadingAnchor.constraint(equalTo: categoryButtonContainer.centerXAnchor, constant: buttonMargin).isActive = true
        boredButton.trailingAnchor.constraint(equalTo: categoryButtonContainer.trailingAnchor).isActive = true
    }
    
    
    
    func presentQuizScreen(categoryImage: UIImage, categoryTitle: String){
        let questionViewController = QuestionViewController(
            categoryImage: categoryImage,
            categoryTitle: categoryTitle
            )
        navigationController?.pushViewController(questionViewController, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTopBlobs()
        setupBottomBlobs()
        displayHomeTitle()
        topBlobsImageView.image = UIImage(named: "topBlobs")
        bottomBlobsImageView.image = UIImage(named: "bottomBlobs")
        setupContainer()
        setupExistentialCrisisButton()
        setupFoodieButton()
        setupLoveButton()
        setupBoredButton()
        navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
    }


}
