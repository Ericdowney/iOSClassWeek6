//
//  ViewController.swift
//  TraitTest
//
//  Created by Downey, Eric on 12/12/16.
//  Copyright © 2016 Downey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var displayer: AlertDisplayer = {
        RealAlertDisplayer(controllerPresenter: self)
    }()

    @IBAction func buttonTapped() {
        displayer.displayAlert(with: "Title", and: "Message")
    }
    
}

protocol DismissableKeyboard {
    func dismissKeyboard()
}

extension UIViewController: DismissableKeyboard {
    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
}

protocol CloseableController {
    func close()
}

extension UIViewController: CloseableController {
    @IBAction func close() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
