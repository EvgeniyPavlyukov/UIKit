//
//  MenuCollectionViewCell.swift
//  UIImageView
//
//  Created by Eвгений Павлюков on 04.11.2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "identifier"
    
    var menu: Menu? {
        didSet {
            myLabel.text = menu?.name
            if let image = menu?.imageName {
                myImageView.image = UIImage(named: image)
            }
        }
    }
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.backgroundColor = .systemMint
        myLabel.textAlignment = .center
        return myLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.translatesAutoresizingMaskIntoConstraints = false // this is crutial otherwise constraints are not gonna work
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
        
        NSLayoutConstraint(item: myImageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: myImageView,
                           attribute: .trailingMargin,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: myImageView,
                           attribute: .leadingMargin,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: myImageView,
                           attribute: .bottomMargin,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .bottomMargin,
                           multiplier: 0.75,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: myLabel,
                           attribute: .topMargin,
                           relatedBy: .equal,
                           toItem: myImageView,
                           attribute: .bottomMargin,
                           multiplier: 1.15,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: myLabel,
                           attribute: .trailingMargin,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: myLabel,
                           attribute: .leadingMargin,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: myLabel,
                           attribute: .bottomMargin,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
}


