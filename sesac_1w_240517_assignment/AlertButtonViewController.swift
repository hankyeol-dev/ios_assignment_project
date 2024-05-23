//
//  AlertButtonViewController.swift
//  sesac_1w_240517_assignment
//
//  Created by 강한결 on 5/22/24.
//

import UIKit

class AlertButtonViewController: UIViewController {

    @IBOutlet var alertButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func presentAlert() {
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        
        alert.addAction(
            UIAlertAction(title: "확인", style: .default)
        )
        alert.addAction(
            UIAlertAction(
                title: "취소",
                style: .cancel,
                handler: {
                    action in
                    self.alertButton.setTitle("버튼 이름 변경", for: .normal)
        }))
        
        present(alert, animated: true)
    }
}
