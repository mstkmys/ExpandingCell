//
//  TableViewController.swift
//  ExpandingCell
//
//  Created by Miyoshi Masataka on 2018/05/03.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tableViewData = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableViewData = [
            CellData(opend: false, title: "Section1", sectionData: [
                SectionData(cell: "Cell1", image: #imageLiteral(resourceName: "sunset")),
                SectionData(cell: "Cell2", image: #imageLiteral(resourceName: "pretty_face")),
                SectionData(cell: "Cell3", image: #imageLiteral(resourceName: "small_cosmo"))
            ]),
            CellData(opend: false, title: "Section2", sectionData: [
                SectionData(cell: "Cell1", image: #imageLiteral(resourceName: "no_title")),
                SectionData(cell: "Cell2", image: #imageLiteral(resourceName: "half_moon"))
            ]),
            CellData(opend: false, title: "Section3", sectionData: [
                SectionData(cell: "Cell1", image: #imageLiteral(resourceName: "pretty_face")),
                SectionData(cell: "Cell2", image: #imageLiteral(resourceName: "child")),
                SectionData(cell: "Cell3", image: #imageLiteral(resourceName: "Anywhere-ITW")),
                SectionData(cell: "Cell4", image: #imageLiteral(resourceName: "small_cosmo"))
            ])
        ]
    }
    
}

// MARK: - Table view datasource
/*******************************************************************************************/
extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opend {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.cellImageView.image = nil
        if indexPath.row == 0 {
            cell.titleLabel.text = tableViewData[indexPath.section].title
            cell.cellImageView.image = #imageLiteral(resourceName: "colorful_blackandwhite")
            return cell
        } else {
            cell.titleLabel.text = tableViewData[indexPath.section].sectionData[dataIndex].cell
            cell.cellImageView.image = tableViewData[indexPath.section].sectionData[dataIndex].image
            return cell
        }
    }
    
}

// MARK: - Table view delegate
/*******************************************************************************************/
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opend {
                tableViewData[indexPath.section].opend = false
            } else {
                tableViewData[indexPath.section].opend = true
            }
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
    
}
























