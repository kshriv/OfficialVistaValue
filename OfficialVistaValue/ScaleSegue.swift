//
//  ScaleSegue.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/14/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import Foundation
import UIKit

class ScaleSegue : UIStoryboardSegue {
    
    override func perform() {
        print("PERFORM RAN")
        scale()
    }

    
    func scale() {
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = originalCenter
        
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }
}
