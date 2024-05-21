//
//  LoginViewController.swift
//  sesac_1w_240517_assignment
//
//  Created by 강한결 on 5/21/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var signInTextFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInTextFields.enumerated().forEach {
            field in self.textFieldStyling(field.element, elementIndex: field.offset)
        }
    }
    
    func textFieldStyling(_ field: UITextField, elementIndex offset: Int) {
        field.borderStyle = .roundedRect
        
        if offset != 0 {
            field.isSecureTextEntry = true
        }
        
        if offset == 2 {
            field.returnKeyType = .done
        }
    }

}
