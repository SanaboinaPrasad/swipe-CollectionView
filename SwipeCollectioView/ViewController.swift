//
//  ViewController.swift
//  Autolayout
//
//  Created by Sriram Prasad on 02/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let topCantainerView = UIView()
    let imageView = UIImageView()
    let label = UITextView()
    private let nextButton = UIButton(type:.system)
    private let prevButton = UIButton(type:.system)
    private let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        placeBottonControls()
    }

 func  setupViews(){
  
    topCantainerView.backgroundColor = .blue
    topCantainerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(topCantainerView)
    topCantainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topCantainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topCantainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    topCantainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
//placing imageView on ContainerView
    imageView.image = UIImage(named: "green")
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 100
    imageView.clipsToBounds = true
    topCantainerView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints  = false
    imageView.centerYAnchor.constraint(equalTo: topCantainerView.centerYAnchor).isActive = true
    imageView.centerXAnchor.constraint(equalTo: topCantainerView.centerXAnchor).isActive = true
    imageView.heightAnchor.constraint(equalTo: topCantainerView.heightAnchor, multiplier: 0.5).isActive = true
    
    
    
//    plaing desciption text
    label.text = "Lets do Something Dude"
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isScrollEnabled = false
    label.isEditable = false

    let yourAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 25)]
    let yourOtherAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14)]
    let partOne = NSMutableAttributedString(string: "This is an example ", attributes: yourAttributes)
    let partTwo = NSMutableAttributedString(string: "\n\n\nfor the combination of Attributed String!", attributes: yourOtherAttributes)
    partOne.append(partTwo)
    label.attributedText = partOne
    label.textAlignment = .center
    view.addSubview(label)
    label.topAnchor.constraint(equalTo: topCantainerView.bottomAnchor).isActive = true
    label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
    label.bottomAnchor.constraint(equalTo:view.bottomAnchor,constant: 10 ).isActive = true
    }

    
    
    fileprivate func placeBottonControls(){
        
        prevButton.backgroundColor = .clear
        view.addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Prev", for: .normal)
        prevButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        prevButton.setTitleColor(.red, for: .normal)
       
        
        
        nextButton.backgroundColor = .clear
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.setTitle("Next", for: .normal)
        
        
        
        let greenView = UIView()
            greenView.backgroundColor = .mainColour
        
        pageControl.currentPage  = 0
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = .red
      
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
            bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlsStackView.axis = .horizontal
            bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        
        
        NSLayoutConstraint.activate([

            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            
            ])
    }
  
    }

extension UIColor {
 static  let mainColour = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}
