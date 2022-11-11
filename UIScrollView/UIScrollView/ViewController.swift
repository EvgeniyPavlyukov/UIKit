//
//  ViewController.swift
//  UIScrollView
//
//  Created by Eвгений Павлюков on 13.09.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var myScrollView = UIScrollView()
    var myImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nightTheme = UIImage(named: "background")
        let pipe = UIImage(named: "PipeUp")
        
        let scrollViewRect = self.view.bounds
        
        myScrollView = UIScrollView(frame: scrollViewRect)
        myScrollView.isPagingEnabled = true //позволяет сделать фиксированную прокрутку
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 2, height: scrollViewRect.size.height)
        
        self.view.addSubview(myScrollView)
        
        //createConteiner for nightTheme
        var imageViewRect = self.view.bounds
        
        if let newNightTheme = nightTheme {
            let nightThemeImageView = self.newImageViewWithImage(paramImage: newNightTheme, paramFrame: imageViewRect)
            myScrollView.addSubview(nightThemeImageView)
        }
            
            
        //nextPageSwipe
        imageViewRect.origin.x += imageViewRect.size.width
        if let newPipe = pipe {
            let pipeImageView = newImageViewWithImage(paramImage: newPipe, paramFrame: imageViewRect)
            self.myScrollView.addSubview(pipeImageView)
        }
            
//        createScrollView()
    }

    
    //newImageViewWithImage
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
    
//    func createScrollView() {
//        let imageToLoad = UIImage(named: "background")
//        myImageView = UIImageView(image: imageToLoad)
//        myScrollView = UIScrollView(frame: self.view.bounds)
//        myScrollView.addSubview(myImageView)
//        myScrollView.contentSize = self.myImageView.bounds.size
//        myScrollView.delegate = self
//        myScrollView.indicatorStyle = .white
//        self.view.addSubview(myScrollView)
//    }
//
//    //MARK - UIScrollViewDelegate
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let p = "начинается прокрутка"
//        print(p)
//        print(scrollView.contentOffset.y)
//        self.myScrollView.alpha = 0.5
//    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let p = "Вызывается после прокрутки"
//        print(p)
//        self.myScrollView.alpha = 1.0
//    }
//
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let p = "Гарантирует что вернет alpha к 1"
//        print(p)
//        self.myScrollView.alpha = 1.0
//    }
    
}


