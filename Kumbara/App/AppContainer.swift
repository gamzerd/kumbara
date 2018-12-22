//
//  AppContainer.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let dataSource = LootDataSource()
}
