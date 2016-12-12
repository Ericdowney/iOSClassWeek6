//
//  ViewController.swift
//  TraitTest
//
//  Created by Downey, Eric on 12/12/16.
//  Copyright © 2016 Downey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Cancel", style: .destructive, handler: nil) )
        alert.addAction( UIAlertAction(title: "Do Something", style: .default, handler: nil) )
        
        present(alert, animated: UIView.areAnimationsEnabled, completion: nil)
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
