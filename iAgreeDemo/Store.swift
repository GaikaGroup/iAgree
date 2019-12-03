//
//  Store.swift
//  iAgreeDemo
//
//  Created by Dmitry Kocherovets on 28.11.2019.
//  Copyright © 2019 Dmitry Kocherovets. All rights reserved.
//

import Foundation
import RedSwift
//
//func delay(_ delay: Double, closure: @escaping () -> ()) {
//    let when = DispatchTime.now() + delay
//    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
//}


class DependencyContainer: SideEffectDependencyContainer {
}

var store = Store<State>(state: State(),
                         queueTitle: "queueTitle",
                         sideEffectDependencyContainer: DependencyContainer(),
                         middleware: [])

struct State: RootStateType, Equatable {
    
}
