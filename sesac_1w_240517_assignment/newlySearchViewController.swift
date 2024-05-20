//
//  newlySearchViewController.swift
//  sesac_1w_240517_assignment
//
//  Created by 강한결 on 5/19/24.
//

import UIKit

class newlySearchViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchedLabel: UILabel!
    
    let keyWordList: Dictionary<String, String> = [
        "프로크랙": "그 프로크랙 능력 덕분에 어려운 프로젝트도 쉽게 마무리했어!",
        "투더문": "투더문으로 시작한 프로젝트가 더 많은 투자와 어더런스를 받았어!",
        "콘틴쥬": "매주 업로드하는 블로그가 정말로 콘틴쥬 느낌이야!"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.placeholder = "검색해주세요."
        searchTextField.borderStyle = .bezel
        searchedLabel.text = "검색해주세요."
        
    }
 
    
    @IBAction func searchingAction(_ sender: UITextField) {
        let searchedWord = sender.text ?? ""
        if keyWordList.keys.contains(searchedWord) {
            searchedLabel.text = keyWordList[searchedWord]
        } else {
            searchedLabel.text = "검색 결과가 없습니다."
        }
    }
    
    
    @IBAction func searchingButtonAction(_ sender: UIButton) {
        let searchedWord = searchTextField.text ?? ""
        
        if keyWordList.keys.contains(searchedWord) {
            searchedLabel.text = keyWordList[searchedWord]
        } else {
            searchedLabel.text = "검색 결과가 없습니다."
        }
    }
    
    @IBAction func touchKeyboardDown(_ sender: Any) {
        self.view.endEditing(true)
    }
}
