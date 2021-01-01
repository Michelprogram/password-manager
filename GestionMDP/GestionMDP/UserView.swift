//
//  UserView.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 20/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

//Faire des variables globals
/*
 Pour user id
 Pour open
 Pour list password
 */
import SwiftUI

struct UserView: View {
    
    private var username : String
        
    @EnvironmentObject var settings : Settings

    init(username : String){
        self.username = username
    }
    
    var body: some View {
        ZStack{
            
            VStack(alignment:.center){
                
                topView()
                
                Text(self.username)
                .font(.largeTitle)
                .padding(.top,50)
                .foregroundColor(settings.text)
                                
                HStack{
                    Text("Website")
                    Text("Identifiant")
                    Text("Password")
                    
                }
                .font(.system(size:25))
                .padding(.top,30)
                .foregroundColor(settings.text)
                
                Listuser()
                
                Spacer()
                
                
            }

            .padding(.top,20)
                
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .contentShape(Rectangle())
            .onTapGesture {
                self.settings.open = false
            }
            
            
            AddView()
            
        }
        .onAppear{
            self.settings.listpassword = self.settings.Myrequest.datauser(userid: "\(self.settings.userid)")
        }
        .background(self.settings.background)
        
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(username: "dorian")
    }
}
