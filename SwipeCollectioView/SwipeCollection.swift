//
//  SwipeCollection.swift
//  SwipeCollectioView
//
//  Created by Sriram Prasad on 02/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
class SWipeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    let cellId = "Cell"
   
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .green
        collectionView.isPagingEnabled = true
        collectionView.register(SwipeCell.self, forCellWithReuseIdentifier: cellId)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellId , for: indexPath) as! SwipeCell
//        cell.backgroundColor  = indexPath.row%2 == 0 ? .green : .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class SwipeCell: UICollectionViewCell {
    
    let topCantainerView = UIView()
    let imageView = UIImageView()
    let label = UITextView()
    private let pageControl = UIPageControl()
    private let nextButton = UIButton(type:.system)
    private let prevButton = UIButton(type:.system)
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        placeBottonControls()

        backgroundColor = .purple
    }
    
    
    
    
    func  setupViews(){
    
    topCantainerView.backgroundColor = .blue
    topCantainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topCantainerView)
    topCantainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topCantainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topCantainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    topCantainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
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
    addSubview(label)
    label.topAnchor.constraint(equalTo: topCantainerView.bottomAnchor).isActive = true
    label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    label.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
    label.bottomAnchor.constraint(equalTo:bottomAnchor,constant: 10 ).isActive = true
    }
    
    
    
    fileprivate func placeBottonControls(){
        
        prevButton.backgroundColor = .clear
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Prev", for: .normal)
        prevButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        prevButton.setTitleColor(.red, for: .normal)
        
        
        
        nextButton.backgroundColor = .clear
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.setTitle("Next", for: .normal)
        
        
        
        let greenView = UIView()
        greenView.backgroundColor = .mainColour

        pageControl.currentPage  = 0
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = .red
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.distribution = .fillEqually
        addSubview(bottomControlsStackView)
        
        
        
        NSLayoutConstraint.activate([
            
            bottomControlsStackView.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            
            ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
