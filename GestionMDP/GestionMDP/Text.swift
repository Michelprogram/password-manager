//
//  Text.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 19/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//
import SwiftUI

struct DefaultText:View{
    private var text : String = ""
    private var flag : Bool = true
    
    init(text:String,flag:Bool = true){
        self.text = text
        self.flag = flag
    }
    
    var body: some View{
        Text(self.text)
        .font(.system(size: 30))
        .foregroundColor(.black)
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(flag ? Color.gray : Color.black, lineWidth: 2))
    }
}

struct DefaultImage : View{
    private var name : String
    
    init(name:String){
        self.name = name

    }
    
    var body: some View{
        Image(systemName: self.name)
        .font(.system(size: 30))
        .foregroundColor(Color(red: 98 / 255, green: 210 / 255, blue: 117 / 255))
        
    }
}


struct PasswordInList : View {
    
    @State private var hide = true
    private var textpassword : String
    private var text = ""
    
    init(text:String) {
        self.textpassword = text
        convert()
    }
    
    private mutating func convert() -> Void{
        for _ in 0...self.textpassword.count{
            self.text += "•"
        }
    }
    
    var body : some View{
        HStack{
            Text(hide ? text : textpassword).font(.system(size: 20))
            
            Image(systemName: self.hide ? "eye.fill" : "eye.slash.fill").onTapGesture {
                self.hide = self.hide ? false : true
            }
            
        }
        
    }
}


struct Text_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            DefaultImage(name: "plus")

        }.background(Color.black)
    }
}
