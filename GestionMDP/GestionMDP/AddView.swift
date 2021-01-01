//
//  AddView.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 25/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @State private var website : String = ""
    @State private var identifiant : String = ""
    @State private var password : String = ""

    @EnvironmentObject var settings : Settings
        
    var body: some View {
        
        VStack{
            
            
            HStack(){
                Spacer()
            }.padding(.top,100)
            
            VStack{
                MyTextFiedl(label:"Website",value: $website)
                .padding(.bottom,20)
                MyTextFiedl(label:"Identifiant",value: $identifiant)
                .padding(.bottom,20)
                MyTextFiedl(label:"Password",value: $password)
                
                ButtonAdd(website: $website, identifiant: $identifiant, password: $password)
                    
                Spacer()
                
            }
            
        }
        .overlay(Rectangle()
            .stroke(Color.black, lineWidth: 1)
        )
        
        .background(self.settings.background)
        .offset(x: self.settings.open ? 0 : -UIScreen.main.bounds.width)
        .animation(.default)
        .padding(.trailing,165)
        .edgesIgnoringSafeArea(.vertical)
        
        
    }
    
}
