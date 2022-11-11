//
//  ViewController.swift
//  UIImageView
//
//  Created by Eвгений Павлюков on 12.09.2022.
//

import UIKit

class Controller: UIViewController { // это типа контроллер А НЕ ВЬЮ!
    
    private var collection: UICollectionView?
    
    var itemArray: [Menu] = {
       var blankMenu = Menu()
        blankMenu.name = "dice4"
        blankMenu.imageName = "dice4"
        
        var blankMenu2 = Menu()
         blankMenu2.name = "dice5"
         blankMenu2.imageName = "dice5"
        
        var blankMenu3 = Menu()
         blankMenu3.name = "dice5"
         blankMenu3.imageName = "dice5"
        
        var blankMenu4 = Menu()
         blankMenu4.name = "dice5"
         blankMenu4.imageName = "dice5"
        
        var blankMenu5 = Menu()
         blankMenu5.name = "dice5"
         blankMenu5.imageName = "dice5"
        
        var blankMenu6 = Menu()
         blankMenu6.name = "dice5"
         blankMenu6.imageName = "dice5"
        
        var blankMenu7 = Menu()
         blankMenu7.name = "dice5"
         blankMenu7.imageName = "dice5"
        
        var blankMenu8 = Menu()
         blankMenu8.name = "dice5"
         blankMenu8.imageName = "dice5"
        
        var blankMenu9 = Menu()
         blankMenu9.name = "dice5"
         blankMenu9.imageName = "dice5"
        
        return [blankMenu, blankMenu2, blankMenu3, blankMenu4, blankMenu5, blankMenu6, blankMenu7, blankMenu8, blankMenu9]
    }()

    override func viewDidLoad() {
        createCollectionView()
        
    }
    
    func createCollectionView() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
//        collection?.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumLineSpacing = Constants.minimumLineSpacing
        collection?.backgroundColor = .white
        collection?.contentInset = UIEdgeInsets(top: Constants.topDistanceToView, left: Constants.leftDistanceToView, bottom: Constants.bottomDistanceToView, right: Constants.rightDistanceToView)
        guard let collection = collection else {
            return
        }
        collection.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        collection.frame = view.bounds
        view.addSubview(collection)
    }


}

extension Controller: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell {
            
            itemCell.menu = itemArray[indexPath.row]
            
            return itemCell
        }
    
        
        return UICollectionViewCell()
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.itemWidth, height: Constants.itemWidth)
    }
    
    }

    
    
