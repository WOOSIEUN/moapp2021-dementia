//
//  ContentView.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/25.
//

import SwiftUI

struct ContentView: View {
    var DementiaTestVM: DementiaTestVM
    
    var body: some View {
        VStack {
            ForEach(DementiaTestVM.testItems) { testItem in
                DementiaTestView(testItem: testItem).onTapGesture {
                    DementiaTestVM.chooseTrue(testItem: testItem)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}


struct DementiaTestView: View {
        var testItem: DementiaTestM<String>.TestItem
        
        var body: some View {
            ZStack{
            //if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(testItem.content)
            //} else {
                //RoundedRectangle(cornerRadius: 10.0).fill()
                    
            //}
        }
    }
}
