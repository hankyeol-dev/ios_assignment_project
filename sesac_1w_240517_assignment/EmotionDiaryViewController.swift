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
    
    var labelCounts: Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageButtons.forEach { el in
            labelCounts.append(UserDefaults.standard.integer(forKey: "\(el.tag)"))
            labelStyling(imageLabels[el.tag], title: "감정", labelTag: el.tag)
        }
    }
    
    func labelStyling(_ label: UILabel, title labelTitle: String, labelTag tag: Int) {
        label.text = labelTitle + ": \(labelCounts[tag])"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 13)
    }
    
    @IBAction func touchCountUp(_ sender: UIButton) {
        labelCounts[sender.tag] += 1
        imageLabels[sender.tag].text = "감정: " + "\(labelCounts[sender.tag])"
        UserDefaults.standard.set(labelCounts[sender.tag], forKey: "\(sender.tag)")
    }
}
