//
//  ContentView.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/25.
//

import SwiftUI

struct ContentView: View {
    //var DementiaTestVM: DementiaTestVM
    var csv_content : read_csvfile
    init(csv_content: read_csvfile){
        self.csv_content=csv_content
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    NavigationLink(
                        destination: DementiaGuideView(),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.white)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("치매 교육")
                            }
                        }
                    )
                    NavigationLink(
                        destination: DementiaTestView(),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.white)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("자가 진단")
                            }
                        }
                    )
                }
                HStack{
                    NavigationLink(
                        destination: GameView(),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.white)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("게임")
                            }
                        }
                    )
                    //두 번 들어가면 렉 걸림
                    NavigationLink(
                        destination: CenterView(csv_content: csv_content),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.white)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("센터 안내")
                            }
                        }
                    )
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
        
//        VStack {
//            ForEach(DementiaTestVM.testItems) { testItem in
//                DementiaTestView().onTapGesture {
//                    DementiaTestVM.chooseTrue(testItem: testItem)
//                }
//            }
//        }
//            .padding()
//            .foregroundColor(Color.orange)
//            .font(Font.largeTitle)
//    }
}
//struct DementiaTestView: View {
//        var testItem: DementiaTestM<String>.TestItem
//
//        var body: some View {
//            ZStack{
//            //if card.isFaceUp {
//                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
//                Text(testItem.content)
//            //} else {
//                //RoundedRectangle(cornerRadius: 10.0).fill()
//
//            //}
//        }
//    }
//}

//    struct Content_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }
