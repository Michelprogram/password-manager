//
//  Mylist.swift
//  GestionMDP
//
//  Created by Dorian Gauron on 20/12/2020.
//  Copyright © 2020 Dorian Gauron. All rights reserved.
//

import Foundation
import SwiftUI


struct Listuser : View {
    
    @EnvironmentObject var settings : Settings
    
    var body: some View{
        VStack{
            
            ForEach(self.settings.listpassword){ data in
                HStack(alignment:.center){

                    Spacer()
                        
                    HStack{
                        Text("\(data.Website)")
                        Text("\(data.Identifiant)")
                    }.font(.system(size: 25))

                    PasswordInList(text: "\(data.Password)")
                            
                    ButtonDelete(data: data)
                        
                    Spacer()
                    
                }.foregroundColor(self.settings.text)
            }

        }
    }
}


