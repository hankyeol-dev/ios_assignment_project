//
//  ShoppingListTableViewController.swift
//  sesac_1w_240517_assignment
//
//  Created by 강한결 on 5/24/24.
//

import UIKit

struct DataSet {
    var isChecked: Bool
    var isLiked: Bool
    let text: String
}

class ShoppingListTableViewController: UITableViewController {
    
    var datas: [DataSet] = []
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 80
        
        addTextField.placeholder = "추가할 내용을 작성해주세요."
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoplistcell") as! ShopListCell
        
        let data = datas[indexPath.row]
        
        cell.cellText.text = data.text
        cell.cellText.font = .systemFont(ofSize: 18)
        
        self.stylingButton(cell.cellFrontButton, isTouched: datas[indexPath.row].isChecked, buttonImg: [UIImage(systemName: "checkmark.circle")!, UIImage(systemName: "checkmark.circle.fill")!])
        cell.cellFrontButton.tag = indexPath.row
        cell.cellFrontButton.addTarget(self, action: #selector(touchCheckButton), for: .touchUpInside)
        
        self.stylingButton(cell.cellEndButton, isTouched: datas[indexPath.row].isLiked, buttonImg: [UIImage(systemName: "star")!, UIImage(systemName: "star.fill")!])
        cell.cellEndButton.tag = indexPath.row
        cell.cellEndButton.addTarget(self, action: #selector(touchLikeButton), for: .touchUpInside)
        
        return cell
    }
    
    
    @IBAction func touchAddButton(_ sender: UIButton) {
        guard let addText = addTextField.text, addText.count >= 1 else {
            return;
        }
        
        datas.append(DataSet(isChecked: false, isLiked: false, text: addText))
        addTextField.text = ""
        
        self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
    }
    
    @objc func touchCheckButton(target: UIButton) {
        datas[target.tag].isChecked.toggle()
        self.tableView.reloadRows(at: [IndexPath(row: target.tag, section: 0)], with: .none)
    }
    
    @objc func touchLikeButton(target: UIButton) {
        datas[target.tag].isLiked.toggle()
        self.tableView.reloadRows(at: [IndexPath(row: target.tag, section: 0)], with: .none)
    }
    
    func stylingButton(_ button: UIButton, isTouched: Bool, buttonImg: [UIImage]) {
        if isTouched {
            button.setImage(buttonImg[1], for: .normal)
            button.tintColor = .systemGreen
        } else {
            button.setImage(buttonImg[0], for: .normal)
            button.tintColor = .systemGray.withAlphaComponent(0.5)
        }
    }
}
