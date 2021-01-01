//
//  Popup.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 19/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import Foundation
import SwiftUI

func PopUp(message:String) -> Void{
    let alert = UIAlertController(title: "⚠️ Warning ⚠️", message: message, preferredStyle: .alert)
    
    let OK = UIAlertAction(title:"OK",style: .default)
    
    alert.addAction(OK)
        
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {})
}





struct Userid : Decodable{
    let id : Int
}

struct Valid : Decodable {
    let info : Bool
}

struct DatauserList : Decodable{
    let Website : String
    let Identifiant : String
    let Password : String
}

struct Datauser : Identifiable{
    let id = UUID()
    let Website : String
    let Identifiant : String
    let Password : String
}

struct Path{
    static let getuserid = "http://localhost:3000/GestionnaireMDP/API/userid/"
    static let check = "http://localhost:3000/GestionnaireMDP/API/check/"
    static let datauser = "http://localhost:3000/GestionnaireMDP/API/datauser/"
    static let adduser = "http://localhost:3000/GestionnaireMDP/API/adduser"
    static let addpassword = "http://localhost:3000/GestionnaireMDP/API/addpassword"
    static let deluser = "http://localhost:3000/GestionnaireMDP/API/deluser"
    static let delpassword = "http://localhost:3000/GestionnaireMDP/API/delpassword"
    static let combi = "http://localhost:3000/GestionnaireMDP/API/comb/"
}
