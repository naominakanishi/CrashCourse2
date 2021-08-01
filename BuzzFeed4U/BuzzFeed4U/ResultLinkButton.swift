//
//  ResultLinkButton.swift
//  BuzzFeed4U
//
//  Created by Naomi Nakanishi on 30/07/21.
//

import UIKit

class ResultLinkButton: UIView {

    let resultImageView = UIImageView()
    let resultTitle = UILabel()
    let resultSubtitle = UILabel()
    
    func setupResultImageView(){
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(resultImageView)
        resultImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        resultImageView.heightAnchor.constraint(equalTo: resultImageView.widthAnchor, multiplier: 1/3).isActive = true
        resultImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        resultImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupResultTitle(){
        resultTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(resultTitle)
        resultTitle.font = UIFont.boldSystemFont(ofSize: 18)
        resultTitle.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 10).isActive = true
        resultTitle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
    }
    

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
