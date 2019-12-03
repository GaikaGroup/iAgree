//
//  MainTVC.swift
//  iAgreeDemo
//
//  Created by Dmitry Kocherovets on 28.11.2019.
//  Copyright © 2019 Dmitry Kocherovets. All rights reserved.
//

import Foundation
import UIKit
import ReduxVM
import DeclarativeTVC
import RedSwift

enum MainTVCModule {

    class Presenter: PresenterBase<TableProps, State> {

        override func reaction(for box: StateBox<State>) -> ReactionToState {
            return .props
        }

        override func props(for box: StateBox<State>) -> TableProps? {

            let rows: [CellAnyModel] = [
                SimpleCellVM(title: "Default usage with navigation controller",
                             selectCommand: Command { Router.shared.showDefaulVC() }
                ),
                SimpleCellVM(title: "Default usage as modal window",
                             selectCommand: Command { Router.shared.showModallyDefaulVC() }
                ),
                SimpleCellVM(title: "Custom usage",
                             selectCommand: Command { Router.shared.showCustomVC() }
                ),
            ]

            return TableProps(tableModel: TableModel(rows: rows))
        }
    }
}

class MainTVC: TVC<TableProps, MainTVCModule.Presenter> {

}
