//
//  Variables.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 30/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import Foundation
import SwiftUI

class Settings : ObservableObject{
    @Published var userid : Int = -1
    @Published var Myrequest = Request()
    @Published var open = false
    @Published var listpassword = [Datauser]()
    
    @Published var background = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    @Published var text = Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)
    @Published var icon = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
}

