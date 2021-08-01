import UIKit

final class ResultQuizView: UIView {
    
    let headline = UILabel()
    let buzzfeedUrl: String
    
    init(buzzfeedUrl: String, resultTitle: String, quizImageName: String, quizTitle: String, quizSubtitle: String) {
        self.buzzfeedUrl = buzzfeedUrl
        super.init(frame: .zero)
        
        let button = ResultQuizButton(tapAction: openBuzzfeedUrl, quizImageName: quizImageName, quizTitle: quizTitle, quizSubtitle: quizSubtitle)
        setupLayout(using: button)
        headline.text = resultTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("This is only used by the storyboard!")
    }
    
    func openBuzzfeedUrl() {
        guard let url = URL(string: buzzfeedUrl) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func setupLayout(using button: ResultQuizButton) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        headline.translatesAutoresizingMaskIntoConstraints = false
        headline.numberOfLines = 0
        headline.font = UIFont.boldSystemFont(ofSize: 20)
        headline.tintColor = UIColor(named: "darkGreyColor")
        
        addSubview(headline)
        addSubview(button)
        
        headline.topAnchor.constraint(
            equalTo: topAnchor
        ).isActive = true
        headline.leadingAnchor.constraint(
            equalTo: button.leadingAnchor
        ).isActive = true
        headline.trailingAnchor.constraint(
            equalTo: trailingAnchor
        ).isActive = true
        
        button.leadingAnchor.constraint(
            equalTo: leadingAnchor
        ).isActive = true
        button.topAnchor.constraint(
            equalTo: headline.bottomAnchor,
            constant: 10
        ).isActive = true
        button.bottomAnchor.constraint(
            equalTo: bottomAnchor
        ).isActive = true
        button.trailingAnchor.constraint(
            equalTo: trailingAnchor
        ).isActive = true
    }
}

final class ResultQuizButton: UIView {
    
    // MARK: - Inner types
    
    enum Layout {
        static let wMultiplier: CGFloat = 0.9
        enum QuizImageView {
            static let aspectRatio: CGFloat = 1/3
            static let topMargin: CGFloat = 20
        }
        enum QuizTitle {
            static let topMargin: CGFloat = 15
        }
    }
    
    // MARK: - UI Components

    private let quizImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let quizTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.tintColor = UIColor(named: "violetColor")
        label.numberOfLines = 0
        return label
        
    }()
    private let quizSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.tintColor = UIColor(named: "darkGreyColor")
        label.numberOfLines = 0
        return label
        
    }()
    
    // MARK: - Dependencies
    let tapAction: () -> Void
    
    // MARK: - Initialization
    
    init(tapAction: @escaping () -> Void, quizImageName: String, quizTitle: String, quizSubtitle: String) {
        self.tapAction = tapAction
        
        super.init(frame: .zero)
        
        self.quizImageView.image = UIImage(named: quizImageName)
        self.quizTitle.text = quizTitle
        self.quizSubtitle.text = quizSubtitle
        
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(named: "purpleButtonColor")
        
        setupQuizImageView()
        setupQuizTitle()
        setupQuizSubtitle()
        
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        
        addGestureRecognizer(tapAction)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods

    func setupQuizImageView() {
        self.addSubview(quizImageView)
        quizImageView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        quizImageView.widthAnchor.constraint(
            equalTo: self.widthAnchor,
            multiplier: Layout.wMultiplier
        ).isActive = true
        quizImageView.heightAnchor.constraint(
            equalTo: quizImageView.widthAnchor,
            multiplier: Layout.QuizImageView.aspectRatio
        ).isActive = true
        quizImageView.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: Layout.QuizImageView.topMargin
        ).isActive = true
    
    }
    
    func setupQuizTitle(){
        self.addSubview(quizTitle)
        quizTitle.topAnchor.constraint(
            equalTo: quizImageView.bottomAnchor,
            constant: Layout.QuizTitle.topMargin
        ).isActive = true
        quizTitle.widthAnchor.constraint(
            equalTo: self.widthAnchor,
            multiplier: Layout.wMultiplier
        ).isActive = true
        quizTitle.leadingAnchor.constraint(
            equalTo: quizImageView.leadingAnchor
        ).isActive = true
    }
    
    func setupQuizSubtitle(){
        self.addSubview(quizSubtitle)
        quizSubtitle.topAnchor.constraint(
            equalTo: quizTitle.bottomAnchor,
            constant: 5
        ).isActive = true
        quizSubtitle.widthAnchor.constraint(
            equalTo: self.widthAnchor,
            multiplier: Layout.wMultiplier
        ).isActive = true
        quizSubtitle.leadingAnchor.constraint(
            equalTo: quizImageView.leadingAnchor
        ).isActive = true
        quizSubtitle.bottomAnchor.constraint(
            equalTo: bottomAnchor, constant: -10
        ).isActive = true
    }
    
    @objc
    func handleTapGesture() {
        tapAction()
    }
}
