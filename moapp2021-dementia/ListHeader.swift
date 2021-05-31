//
//  ListHeader.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/31.
//

import SwiftUI

struct ListHeader: View {
    var title: String
    var bgColor: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:10.0).fill(bgColor)
            RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 10)
                .foregroundColor(bgColor)
            HStack {
                VStack {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 55))
                        .foregroundColor(Color.white)
                }
            }
        }
        .padding(15)
        .frame(height: 200, alignment: .leading)
        
    }
}

struct ListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ListHeader(title: "Test", bgColor: Color.purple)
    }
}
