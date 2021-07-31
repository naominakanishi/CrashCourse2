//
//  CategoryButton.swift
//  BuzzFeed4U
//
//  Created by Naomi Nakanishi on 27/07/21.
//

import UIKit

class CategoryButton: UIView {
    
    let categoryImageView = UIImageView()
    let categoryTitle = UILabel()
    let tapAction: (CategoryButton) -> Void
    
    func setupCategoryImageView(){
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(categoryImageView)
        categoryImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        categoryImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        categoryImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        categoryImageView.heightAnchor.constraint(equalTo: categoryImageView.widthAnchor, multiplier: 1 ).isActive = true
    }
    
    func setupCategoryTitle(){
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(categoryTitle)
        categoryTitle.font = UIFont.boldSystemFont(ofSize: 18)
        categoryTitle.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10).isActive = true
        categoryTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        categoryTitle.textAlignment = .center
 
    }
    
    func setupNextGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(gesture)
    }
    
    
    @objc func handleTapGesture(){
        print("ta clicando fia")
        tapAction(self)
    }
    
    init(tapAction: @escaping (CategoryButton) -> Void){
        self.tapAction = tapAction
        super.init(frame: .zero)
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(named: "purpleButtonColor")
        setupCategoryImageView()
        setupCategoryTitle()
        setupNextGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (imageName: String, categoryTitle: String){
        categoryImageView.image = UIImage(named: imageName)
        self.categoryTitle.text = categoryTitle
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
