//
//  RegisterView.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 19/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import SwiftUI

struct RegisterView : View{
    @State private var username: String = ""
    @State private var mail: String = ""
    @State private var password: String = ""
        
    
    var body:some View{
        VStack(){
            ContentTextField(label: "Username", secureField: false, value: $username)
            ContentTextField(label: "Mail",secureField: false,value: $mail)
            ContentTextField(label: "Password",secureField: true,value: $password)
            
            HStack(){
                
                ValidButton(username:self.username,mail:self.mail,password:self.password)
                
            }
            .padding(.top, 30.0)
        }
    }
}
