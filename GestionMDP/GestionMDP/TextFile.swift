//
//  TextFile.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 19/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//
import SwiftUI

struct ContentTextField: View{
    
    @Binding private var value : String

    
    private let label: String
    private let secureField: Bool
    
    
    init(label: String,secureField: Bool,value: Binding<String>){
        self.label = label
        self.secureField = secureField
        self._value = value
        
    }
        
    var body: some View{
        VStack (alignment: .center){
            
        HStack(spacing:50){
            Text(label)
                .font(.title)
                .foregroundColor(.black)
            
            if (secureField){
                SecureField("",text: $value)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.gray,lineWidth: 2)
                )
                .frame(width:150)
            }
            else{
                TextField("",text: $value)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.gray,lineWidth: 2)
                )
                .frame(width:150)
            }
            
            }
        }
    }
    
}


struct MyTextFiedl : View{
    
    @Binding private var value : String
    @EnvironmentObject var settings : Settings

    private var label:String
    
    
    init(label:String,value:Binding<String>){
        self._value = value
        self.label = label
    }
    
    var body: some View{
        VStack(alignment:.leading){
            
            Text(label)
                .foregroundColor(settings.text)
            
            TextField("",text:$value)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                .stroke(Color.black,lineWidth: 2)
            )
            .frame(width:180)
            .disableAutocorrection(true)

        }
    }
    
}
