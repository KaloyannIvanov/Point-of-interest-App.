//
//  UIViewController+ActivityIndicator.swift
//  Point of interest App.
//
//  Created by Kaloyan Ivanov on 16.01.20.
//  Copyright © 2020 Kaloyan Ivanov. All rights reserved.
//

import UIKit

fileprivate var spinnerView: UIView?

extension UIViewController {
    
    //MARK: - Func-s
    func addSpin() {
        spinnerView = UIView(frame: self.view.bounds)
        spinnerView?.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.center = spinnerView!.center
        indicator.startAnimating()
        
        DispatchQueue.main.async {
            spinnerView?.addSubview(indicator)
            self.view.addSubview(spinnerView!)
        }
    }
    
    func removeSpin() {
        DispatchQueue.main.async {
            spinnerView?.removeFromSuperview()
            spinnerView = nil
        }
    }
}
