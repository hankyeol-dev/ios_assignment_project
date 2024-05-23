//
//  TableViewCell.swift
//  sesac_1w_240517_assignment
//
//  Created by 강한결 on 5/23/24.
//

import UIKit

class TableViewControllerCell: UITableViewController {
    
    let tableDatas = [["공통사항", "실험실", "버전 정보"],
    ["개인/보안", "알림", "채팅", "멀티 프로필"],
    ["고객센터/운영정책"]]
    let tableSectionHeaders = ["전체 설정", "개인 설정", "기타"]


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableDatas.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDatas[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableSectionHeaders[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTemplate = tableView.dequeueReusableCell(withIdentifier: "assignmentTable", for: indexPath)
        
        
        
        cellTemplate.textLabel?.text = tableDatas[indexPath.section][ indexPath.row]
        return cellTemplate
        
    }
    
    
}
