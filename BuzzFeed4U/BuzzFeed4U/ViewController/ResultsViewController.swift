import UIKit

final class ResultsViewController: UIViewController {
    
    // MARK: - UI Components

    let bottomBlobsImageView = UIImageView()
    let categoryImageView = UIImageView()
    let resultLabel = UILabel()
    let resultsStackView = UIStackView()
    let homeButton = UIButton()
    
    // MARK: - Initialization
    
    init (categoryImage: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        categoryImageView.image = categoryImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    
    func setupBottomBlobs(){
        bottomBlobsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBlobsImageView)
        bottomBlobsImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBlobsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomBlobsImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomBlobsImageView.heightAnchor.constraint(equalTo: bottomBlobsImageView.widthAnchor, multiplier: 374 / 828).isActive = true
        bottomBlobsImageView.image = UIImage(named: "bottomBlobs")
    }
    
    func displayHeaderImage(){
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryImageView)
        categoryImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        categoryImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18).isActive = true
        categoryImageView.heightAnchor.constraint(equalTo: categoryImageView.widthAnchor).isActive = true
    }
    
    func displayheaderTitle(){
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        resultLabel.text = "toma aqui seu quiz <3"
        resultLabel.font = UIFont.boldSystemFont(ofSize: 25)
        resultLabel.textColor = UIColor(named: "violetColor")
        resultLabel.numberOfLines = 0
        resultLabel.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 10).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupResultsStackView() {
        resultsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultsStackView)
        
        resultsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        resultsStackView.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 20).isActive = true
        resultsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultsStackView.bottomAnchor.constraint(lessThanOrEqualTo: homeButton.topAnchor, constant: -20).isActive = true
        
        
        resultsStackView.axis = .vertical
        resultsStackView.distribution = .equalCentering
        resultsStackView.spacing = 20
    }
    
    func setupHomeButton() {
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(homeButton)
        
        homeButton.layer.cornerRadius = 20
        homeButton.addTarget(self, action: #selector(handleHomeButtonTap), for: .touchUpInside)
        homeButton.setTitle("Recomeçar", for: .normal)
        homeButton.backgroundColor = UIColor(named: "nextButtonColor")
        
        homeButton.setTitleColor(.white, for: .normal)
        homeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        homeButton.titleLabel?.textAlignment = .center
        homeButton.titleLabel?.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor, constant: 20).isActive = true
        homeButton.titleLabel?.centerYAnchor.constraint(equalTo: homeButton.centerYAnchor).isActive = true
        
        homeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        homeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
    }
    
    func displayResultView() {
        for (i, result) in QuizManager.shared.getResults().enumerated() {
            let title = i == 0 ?
                result.category.headline() :
                "E, de brinde, vai aqui mais um para você matar seu tempo:"
            
            let view = ResultQuizView(
                buzzfeedUrl: result.buzzfeedUrl,
                resultTitle: title,
                quizImageName: result.imageName,
                quizTitle: result.title,
                quizSubtitle: result.subtitle)
            
            resultsStackView.addArrangedSubview(view)
        }
        
    }
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupBottomBlobs()
        displayHeaderImage()
        displayheaderTitle()
        setupHomeButton()
        setupResultsStackView()
        displayResultView()
    }
    
    // MARK: - Callbacks
    
    @objc
    func handleHomeButtonTap() {
        let startController = CategoriesViewController()
        navigationController?.pushViewController(startController, animated: true)
    }
}
