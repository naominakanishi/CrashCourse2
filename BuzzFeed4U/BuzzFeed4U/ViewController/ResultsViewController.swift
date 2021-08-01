import UIKit

class ResultsViewController: UIViewController {

    let bottomBlobsImageView = UIImageView()
    let categoryImageView = UIImageView()
    let resultLabel = UILabel()
    
    init (categoryImage: UIImage) {
        super.init(nibName: nil, bundle: nil)
        categoryImageView.image = categoryImage
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
        bottomBlobsImageView.image = UIImage(named: "bottomBlobs")
    }
    
    func displayHeaderImage(){
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryImageView)
        categoryImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        categoryImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        categoryImageView.heightAnchor.constraint(equalTo: categoryImageView.widthAnchor).isActive = true
    }
    
    func displayheaderTitle(){
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        resultLabel.text = "Resultado"
        resultLabel.font = UIFont.boldSystemFont(ofSize: 30)
        resultLabel.textColor = UIColor(named: "violetColor")
        resultLabel.numberOfLines = 0
        resultLabel.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 30).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    func resultView() {
        let title = UILabel()
       // let quizButton
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupBottomBlobs()
        displayHeaderImage()
        displayheaderTitle()

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
