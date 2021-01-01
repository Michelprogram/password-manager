//
//  Button.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 19/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import SwiftUI

struct ButtonRegister: View{
    var body : some View{
            NavigationLink(destination:RegisterView()){
                DefaultText(text:"Register")
        }
    }
}

struct ValidButton: View{
    private var username : String
    private var mail: String
    private var password: String
    
    @EnvironmentObject var settings : Settings

    
    init(username:String,mail:String,password:String){
        self.username = username
        self.mail = mail
        self.password = password
    }
    
    var body: some View{
        Button(action:{
            
            if (self.username.isEmpty || self.password.isEmpty || self.mail.isEmpty ){
                PopUp(message: "Merci de renseigner tout les champs.")
            }
                
            else if (!matchesPassword(pass: self.password)){
                PopUp(message: """
                        Password need to contains.\n
                        - 1 Special characters\n
                        - 2 Numbers\n
                        - 1 Captial letter
                        """)
            }
            
            else if (!self.settings.Myrequest.check(parameters: ["user":self.username])){
                PopUp(message: "User already exist.")
            }
                
            else if(!self.settings.Myrequest.check(parameters: ["mail":self.mail])){
                PopUp(message: "Mail adress already exists.")
            }
                
            else {
                if (self.settings.Myrequest.addTodatabase(parameters: ["user":self.username,"password":self.password,"mail":self.mail], status: 0)){
                    PopUp(message: "You have been register !")
                }
            }
        },label:{
            DefaultText(text:"Valider")
        })
    }
}

struct ButtonLogin: View{
    
    private var labeluser : String
    private var labelpassword : String
    
    @State private var login : Bool = false
    
    @EnvironmentObject var settings : Settings

        
    init(labeluser:String,labelpassword:String)
    {
        self.labeluser = labeluser
        self.labelpassword = labelpassword
    }
    
    var body: some View{
            VStack{
                Button(action:{
                    if (!self.settings.Myrequest.check(parameters: ["user":self.labeluser])){
                        if (self.settings.Myrequest.comb(parameters: ["pseudo":self.labeluser,"password":self.labelpassword])){
                            self.login = true
                            self.settings.userid = self.settings.Myrequest.getuserid(pseudo: self.labeluser)

                        }
                        else{
                            PopUp(message: "Password unvalid.")
                        }
                    }
                    else{
                        PopUp(message: "Username unvalid.")
                    }
                },label:{
                    DefaultText(text: "Login")
                    })
                
                NavigationLink(destination:UserView(username:self.labeluser),isActive:$login){
                    EmptyView()
                }.disabled(true)
        }
    }
}

struct ButtonDelete : View{
    
    private var data : Datauser
    @EnvironmentObject var settings : Settings

    init(data:Datauser){
        self.data = data
    }
    
    var body : some View {
        Button(action:{
            if (self.settings.Myrequest.dellTodatabase(parameters: ["website":self.data.Website,"password":self.data.Password,"userid":"\(                self.settings.userid)"], status: 1)){
                PopUp(message: "Element was delete")
            }
            
        },label:{
            Image(systemName: "trash.fill")
            
        })
        .padding(.leading,10)
        .buttonStyle(PlainButtonStyle())
    }
}


struct ButtonAdd : View{
    
    @Binding private var website : String
    @Binding private var identifiant : String
    @Binding private var password : String
    
    @EnvironmentObject var settings : Settings


    init(website:Binding<String>,
         identifiant:Binding<String>,password:Binding<String>){
        self._website = website
        self._identifiant = identifiant
        self._password = password
    }
    
    var body: some View{
        Button(action:{
            
            if (self.website.isEmpty || self.identifiant.isEmpty || self.password.isEmpty){
                PopUp(message: "Merci de renseigner tout les champs.")
            }
            else{
                if (self.settings.Myrequest.addTodatabase(parameters:
                    ["website":self.website,"identifiant":self.identifiant,"password":self.password,"userid":"\(self.settings.userid)"], status: 1)){
                    
                    self.settings.open = false
                    PopUp(message: "New password was register.")
                    self.website = ""
                    self.identifiant = ""
                    self.password = ""
                    self.settings.listpassword = self.settings.Myrequest.datauser(userid: "\(self.settings.userid)")
                    
                }
                
            }
            
        },label: {
            DefaultText(text:"Ajouter",flag: false)
        }).padding(.top,50)

    }
}
