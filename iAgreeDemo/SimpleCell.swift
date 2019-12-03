//
//  SimpleCell.swift
//  iAgreeDemo
//
//  Created by Dmitry Kocherovets on 28.11.2019.
//  Copyright © 2019 Dmitry Kocherovets. All rights reserved.
//

import Foundation
import DeclarativeTVC

class SimpleCell: UITableViewCell {

    @IBOutlet fileprivate var label: UILabel!
}

struct SimpleCellVM: CellModel, SelectableCellModel {

    let title: String?
    var selectCommand: Command

    func apply(to cell: SimpleCell) {
        
        cell.label.text = title
    }
}
