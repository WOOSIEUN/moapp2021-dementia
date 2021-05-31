//
//  ListItem.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/31.
//

import SwiftUI

struct ListItem: View {
    
    var title: String
    var strokeColor: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:10.0).fill(Color.white)
            RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 10)
                .foregroundColor(strokeColor)
            HStack {
                VStack {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .foregroundColor(Color.black)
                }
            }
        }
        .padding(15)
        .frame(height: 150, alignment: .leading)
        
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(title: "Test", strokeColor: Color.purple)
    }
}
