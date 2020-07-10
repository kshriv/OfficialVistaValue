//
//  BackgroundView.swift
//  OfficialVistaValue
//
//  Created by Komal Shrivastava on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit

class BackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCoin()
        setupBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCoin() {
        //MARK: -first
        let xConst = self.frame.width / 10
        
        var image = UIImageView()
        image.image = UIImage(named: "coin")
        image.frame = CGRect(x: 0.5 * xConst, y: -200, width: (xConst), height: (xConst))
        self.addSubview(image)
        
        UIView.animate(withDuration: 7, delay: 2, options: [.repeat, .curveEaseIn], animations: {
            image.frame = CGRect(x: 0.5 * xConst, y: self.frame.midY * 2, width: (xConst), height: (xConst))
        }, completion: nil)
        
        //MARK: -second
        image = UIImageView()
        image.image = UIImage(named: "coin")
        image.frame = CGRect(x: 0.5 * xConst + (2 * xConst), y: -200, width: (xConst), height: (xConst))
        self.addSubview(image)
        
        UIView.animate(withDuration: 7, delay: 1, options: [.repeat, .curveEaseIn], animations: {
            image.frame = CGRect(x:  0.5 * xConst + (2 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
        }, completion: nil)
        
        //MARK: -third
        image = UIImageView()
        image.image = UIImage(named: "coin")
        image.frame = CGRect(x: 0.5 * (xConst) + (4 * (xConst)), y: -200, width: (xConst), height: (xConst))
        self.addSubview(image)

        UIView.animate(withDuration: 7, delay: 3, options: [.repeat, .curveEaseIn], animations: {
            image.frame = CGRect(x:  0.5 * (xConst) + (4 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
        }, completion: nil)
        
        //MARK: -fourth
       image = UIImageView()
       image.image = UIImage(named: "coin")
        image.frame = CGRect(x: 0.5 * (xConst) + (6 * (xConst)), y: -200, width: (xConst), height: (xConst))
       self.addSubview(image)
       
        UIView.animate(withDuration: 7, delay: 0.5, options: [.repeat, .curveEaseIn], animations: {
           image.frame = CGRect(x:  0.5 * (xConst) + (6 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
       }, completion: nil)
        
        //MARK: -fifth
        image = UIImageView()
        image.image = UIImage(named: "coin")
        image.frame = CGRect(x: 0.5 * (xConst) + (8 * (xConst)), y: -200, width: (xConst), height: (xConst))
        self.addSubview(image)

        UIView.animate(withDuration: 5.5, delay: 0, options: [.repeat, .curveEaseIn], animations: {
            image.frame = CGRect(x:  0.5 * (xConst) + (8 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
        }, completion: nil)
        
        //MARK: -first2
            image = UIImageView()
            image.image = UIImage(named: "coin")
            image.frame = CGRect(x: 0.5 * (xConst), y: -200, width: (xConst), height: (xConst))
            self.addSubview(image)
            
        UIView.animate(withDuration: 8.5, delay: 3.8, options: [.repeat, .curveEaseIn], animations: {
                image.frame = CGRect(x: 0.5 * (xConst) + (0 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
            }, completion: nil)
            
            //MARK: -second2
            image = UIImageView()
            image.image = UIImage(named: "coin")
            image.frame = CGRect(x: 0.5 * (xConst) + (2 * (xConst)), y: -200, width: (xConst), height: (xConst))
            self.addSubview(image)
            
        UIView.animate(withDuration: 8.5, delay: 2.2, options: [.repeat, .curveEaseIn], animations: {
                image.frame = CGRect(x:  0.5 * (xConst) + (2 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
            }, completion: nil)
            
            //MARK: -third2
            image = UIImageView()
            image.image = UIImage(named: "coin")
            image.frame = CGRect(x: 0.5 * (xConst) + (4 * (xConst)), y: -200, width: (xConst), height: (xConst))
            self.addSubview(image)

        UIView.animate(withDuration: 8.5, delay: 4.5, options: [.repeat, .curveEaseIn], animations: {
                image.frame = CGRect(x:  0.5 * (xConst) + (4 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
            }, completion: nil)
            
            //MARK: -fourth2
           image = UIImageView()
           image.image = UIImage(named: "coin")
            image.frame = CGRect(x: 0.5 * (xConst) + (6 * (xConst)), y: -200, width: (xConst), height: (xConst))
           self.addSubview(image)
           
        UIView.animate(withDuration: 8.5, delay: 1.4, options: [.repeat, .curveEaseIn], animations: {
               image.frame = CGRect(x:  0.5 * (xConst) + (6 * (xConst)), y: self.frame.midY * 2 , width: (xConst), height: (xConst))
           }, completion: nil)
            
            //MARK: -fifth2
            image = UIImageView()
            image.image = UIImage(named: "coin")
            image.frame = CGRect(x: 0.5 * (xConst) + (8 * (xConst)), y: -200, width: (xConst), height: (xConst))
            self.addSubview(image)

        UIView.animate(withDuration: 8.5, delay: 3.2, options: [.repeat, .curveEaseIn], animations: {
                image.frame = CGRect(x:  0.5 * (xConst) + (8 * (xConst)), y: self.frame.midY * 2, width: (xConst), height: (xConst))
            }, completion: nil)
    }
    
    func setupBackground() {
        let background = UIImage(named: "gradient")
        var imageView : UIImageView!
        imageView = UIImageView(frame: self.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = center
        addSubview(imageView)
        self.sendSubviewToBack(imageView)
    }
}
