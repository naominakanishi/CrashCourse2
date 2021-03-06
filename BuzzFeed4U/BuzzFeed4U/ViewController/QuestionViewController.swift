import UIKit

class QuestionViewController: UIViewController {
    
    let bottomBlobsImageView = UIImageView()
    let categoryImageView = UIImageView()
    let categoryTitle = UILabel()
    let optionsStackView = UIStackView()
   // let question: Question
    var selectedOption: Int?
    let questionTitle = UILabel()
    let nextButton = UIButton()

    
    init (categoryImage: UIImage, categoryTitle: String) {
        super.init(nibName: nil, bundle: nil)
        categoryImageView.image = categoryImage
        self.categoryTitle.text = categoryTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBottomBlobs(){
        bottomBlobsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBlobsImageView)
        bottomBlobsImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBlobsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomBlobsImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomBlobsImageView.heightAnchor.constraint(equalTo: bottomBlobsImageView.widthAnchor, multiplier: 374 / 828).isActive = true
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
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryTitle)
        categoryTitle.font = UIFont.boldSystemFont(ofSize: 25)
        categoryTitle.textColor = UIColor(named: "violetColor")
        categoryTitle.numberOfLines = 0
        categoryTitle.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor).isActive = true
        categoryTitle.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 10).isActive = true
        categoryTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
//        categoryTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupQuestionTitle(){
        questionTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionTitle)
        questionTitle.text = QuizManager.shared.getCurrentQuestion().questionTitle
        questionTitle.font = UIFont.boldSystemFont(ofSize: 30)
        questionTitle.textColor = UIColor(named: "darkGreyColor")
        questionTitle.numberOfLines = 0
        questionTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        questionTitle.topAnchor.constraint(equalTo: categoryTitle.bottomAnchor, constant: 50).isActive = true
        questionTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    func setupOptionsStackView(){
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(optionsStackView)
        optionsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        optionsStackView.widthAnchor.constraint(equalTo: questionTitle.widthAnchor).isActive = true
        optionsStackView.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 50).isActive = true
        optionsStackView.axis = .vertical
        optionsStackView.distribution = .equalCentering
        optionsStackView.spacing = 15.0
        
    }
    
    func createButton(id: Int, option: Option){
        let button = UIButton()
      //  let hMargin: CGFloat = 20
        let vMargin: CGFloat = 20
        button.setTitle(option.option, for: .normal)
        button.backgroundColor = UIColor(named: "purpleButtonColor")
        button.addTarget(self, action: #selector(handleSelectedOption), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(named: "darkGreyColor"), for: .normal)
        optionsStackView.addArrangedSubview(button)
        button.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: vMargin).isActive = true
        button.titleLabel?.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.numberOfLines = 0
        button.layer.cornerRadius = 10
        button.tag = id
    }
    
    func createOptionsButtons(){
        for (i, option) in
            QuizManager.shared.getCurrentQuestion().options.enumerated(){
            createButton(id: i, option: option)
        }
    }
    
    func createNextButton(){
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        nextButton.setTitle("Continuar", for: .normal)
        nextButton.alpha = 0.2
        nextButton.backgroundColor = UIColor(named: "nextButtonColor")
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.textAlignment = .center
        nextButton.titleLabel?.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: 20).isActive = true
        nextButton.titleLabel?.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        nextButton.layer.cornerRadius = 20
        nextButton.addTarget(self, action: #selector(handleNextButtonTap), for: .touchUpInside)
    }
    
    @objc func handleNextButtonTap() {
        guard let selectedOption = self.selectedOption
        else { return }
        QuizManager.shared.handleOptionSelected(at: selectedOption)
        if QuizManager.shared.isQuizDone() {
            let resultsViewController = ResultsViewController(categoryImage: categoryImageView.image)
            navigationController?.pushViewController(resultsViewController, animated: true)
            return
        }
        self.selectedOption = nil
        renderScreen()
    }
    
    @objc func handleSelectedOption(_ button: UIButton) {
        selectedOption = button.tag
        renderScreen()
    }
    
    func renderScreen() {
        
        optionsStackView.subviews.forEach { $0.removeFromSuperview() }
        createOptionsButtons()
        
        questionTitle.text = QuizManager.shared.getCurrentQuestion().questionTitle
        
        optionsStackView.subviews
            .compactMap { $0 as? UIButton }
            .enumerated()
            .forEach { i, button in
                if i == selectedOption {
                    button.backgroundColor = UIColor(named: "nextButtonColor")
                } else {
                    button.backgroundColor = UIColor(named: "purpleButtonColor")
                }
        }
        
        if selectedOption != nil {
            nextButton.alpha = 1
        } else {
            nextButton.alpha = 0.2
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBottomBlobs()
        displayHeaderImage()
        displayheaderTitle()
        bottomBlobsImageView.image = UIImage(named: "bottomBlobs")
        setupQuestionTitle()
        createOptionsButtons()
        setupOptionsStackView()
        createNextButton()
        renderScreen()
        // Do any additional setup after loading the view.

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
