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


    @IBAction func setUserHeight(_ sender: UITextField) {
        /**
         logic
         1. 입력 받는 값을 숫자로 형변환 했을 때, Int 값인지 확인한다.
         2. 입력 받는 값의 길이가 3자 이하인지 확인한다.
            - 3자를 입력하면 키보드 다운  액션 추가
         3. 1, 2를 통과하면 멤버 변수에 저장한다.
         */
        let heightText = sender.text ?? "0"
        if heightText.count == 3 {
            view.endEditing(true)
        }
        userHeight = (Double(heightText) ?? 0) / 100
    }
    
    
    @IBAction func setUserWeight(_ sender: UITextField) {
        let weightText = sender.text ?? "0"
        if weightText.count == 3 {
            view.endEditing(true)
        }
        userWeight = Double(weightText) ?? 0
    }
    
    
    @IBAction func alertUserBMI(_ sender: UIButton) {
        
        // 1. 버튼에 따라서 user의 몸무게, 키 수치 할당
        if sender.tag == 1 {
            // 랜덤 계산
            userHeight = Double.random(in: 1...999) / 100
            userWeight = Double.random(in: 1...999)
        } else {
            // 2. 입력 받은 유저 키 수치가 0일 경우 입력 포커싱
            if userHeight == 0 {
                self.heightField.becomeFirstResponder()
            }
        }
        
        // 3. 모든 검증이 끝나면 alert
        let bmiAlert = UIAlertController(
            title: "BMI 수치는?",
            message: self.calculateBMI(),
            preferredStyle: .alert
        )
        bmiAlert.addAction(UIAlertAction(title: "확인", style: .cancel))
        
        present(bmiAlert, animated: true)
    }
    
    func calculateBMI() -> String {
        return String(format: "%.2f", self.userWeight / pow(userHeight, 2))
    }
}
