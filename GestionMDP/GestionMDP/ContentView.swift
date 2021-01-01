//
//  ContentView.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 07/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var textusername :String = ""
    @State private var textpassword :String = ""
        
    var body: some View {
        NavigationView{
            

        VStack(){
                
            ContentTextField(label: "Username",secureField: false,value: $textusername)
            ContentTextField(label: "Password",secureField: true,value: $textpassword)

            
            HStack(spacing:20){
                
                ButtonLogin(labeluser: self.textusername, labelpassword: self.textpassword)
                ButtonRegister()
                
                }
            .padding(.top, 30.0)
            
            }
        }
    }
}
    
