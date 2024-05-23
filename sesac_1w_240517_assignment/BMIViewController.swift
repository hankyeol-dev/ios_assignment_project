//
//  BMIViewController.swift
//  sesac_1w_240517_assignment
//
//  Created by 강한결 on 5/21/24.
//

import UIKit

class BMIViewController: UIViewController {
    
    @IBOutlet var heightField: UITextField!
    @IBOutlet var weightField: UITextField!
    
    var userHeight: Double = 0
    var userWeight: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightField.keyboardType = .numberPad
        weightField.keyboardType = .numberPad
    }

    
    @IBAction func setUserHeightOrWeight(_ sender: UITextField) {
        /**
         logic
         1. 입력 받는 값을 숫자로 형변환 했을 때, Double 값인지 확인한다.
         2. 입력 받는 값의 길이가 3자 이하인지 확인한다.
            - 3자를 입력하면 키보드 다운  액션 추가
         3. 1, 2를 통과하면 멤버 변수에 저장한다.
         */
        
        let figure = sender.text ?? "0"
        
        if figure.count == 3 {
            view.endEditing(true)
        }
        
        if sender.tag == 1 {
            userHeight = (Double(figure) ?? 0) / 100
        } else {
            userWeight = Double(figure) ?? 0
        }
    }
    
    
    @IBAction func alertUserBMI(_ sender: UIButton) {
        
        // 1. 랜덤 버튼을 누른 경우
        if sender.tag == 1 {
            userHeight = Double.random(in: 1...999) / 100
            userWeight = Double.random(in: 1...999)
        } 
        
        if sender.tag == 2 {
            // 2. 입력 받은 유저 키 수치가 0일 경우 입력 포커싱
            if userHeight == 0 {
                self.heightField.becomeFirstResponder()
                return
            } 
            
            if userWeight == 0 {
                self.weightField.becomeFirstResponder()
                return
            }
        }
        self.presentAlert(sender.tag)

    }
    
    func calculateBMI() -> String {
        return String(format: "%.2f", self.userWeight / pow(self.userHeight, 2))
    }
    
    func presentAlert(_ buttonTag: Int) {
        
        let bmiAlert = UIAlertController(
            title: "BMI 수치는?",
            message: self.calculateBMI(),
            preferredStyle: .alert
        )
        
        bmiAlert.addAction(
            UIAlertAction(
                title: "확인",
                style: .cancel,
                handler: buttonTag == 1 ? {
                    action in
                    self.userHeight = 0
                    self.userHeight = 0
                    self.heightField.text = ""
                    self.weightField.text = ""
                    self.weightField.becomeFirstResponder()
                } : nil
            )
        )
        
        present(bmiAlert, animated: true)
    }
    
    
}
