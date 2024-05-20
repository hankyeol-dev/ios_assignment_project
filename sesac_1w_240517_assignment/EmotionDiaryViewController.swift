//
//  EmotionDiaryViewController.swift
//  sesac_1w_240517_assignment
//
//  Created by 강한결 on 5/19/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {
    
    @IBOutlet var imageButtons: [UIButton]!
    @IBOutlet var imageLabels: [UILabel]!
    
    var labelCounts: Array<Int> = [0,0,0,0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLabels.forEach { el in
            labelStyling(el, title: "감정")
        }
    }
    
    func labelStyling(_ label: UILabel, title labelTitle: String) {
        label.text = labelTitle + ": 0"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 13)
    }
    
    @IBAction func touchCountUp(_ sender: UIButton) {
        labelCounts[sender.tag] += 1
        imageLabels[sender.tag].text = "감정: " + "\(labelCounts[sender.tag])"
    }
}
