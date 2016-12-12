//
//  AlertTraits.swift
//  TraitTest
//
//  Created by Downey, Eric on 12/12/16.
//  Copyright © 2016 Downey. All rights reserved.
//

import UIKit

protocol canPresentViewController {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

extension UIViewController: canPresentViewController {}

protocol AlertDisplayer {
    var controllerPresenter: canPresentViewController { get set }
    
    func displayAlert(with title: String, and message: String)
}

class RealAlertDisplayer: AlertDisplayer {
    var controllerPresenter: canPresentViewController
    
    init(controllerPresenter: canPresentViewController) {
        self.controllerPresenter = controllerPresenter
    }
    
    func displayAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Cancel", style: .destructive, handler: nil) )
        alert.addAction( UIAlertAction(title: "Do Something", style: .default, handler: nil) )
        
        controllerPresenter.present(alert, animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
