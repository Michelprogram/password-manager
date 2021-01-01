//
//  topView.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 29/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import SwiftUI


struct topView: View {
    
    @EnvironmentObject var settings : Settings
    @State private var backgroundflag = false

        
    var body: some View {
            
        HStack{
            

            Button(action:{
                self.settings.open = true
            },
                   label: {
                    DefaultImage(name: "arrow.uturn.left.square.fill")
                        
            }).frame(width: 50, height: 50)
            
        
            Button(action:{
                if (self.backgroundflag){
                    self.settings.background = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                    self.settings.text = Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)

                    self.backgroundflag = false

                }else{
                    self.settings.background = Color(red: 20 / 255, green: 31 / 255, blue: 42 / 255)
                    self.settings.text = Color(red: 203 / 255, green: 203 / 255, blue: 203 / 255)
                    self.backgroundflag = true

                }

            },
                   label: {
                    DefaultImage(name: "moon.circle.fill")
                        
                    
            }).frame(width: 50, height: 50)
            
            
            Button(action:{
                self.settings.open = true
            },
                   label: {
                    DefaultImage(name: "plus")
            }).frame(width: 50, height: 50)
            

            }
        
    }

        
}

