//
//  ContentView.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/25.
//

import SwiftUI

struct ContentView: View {
    @State var isNavigationBarHidden: Bool = false
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
                                Image("치매교육")
                                    .resizable()
                            }
                        }
                    )
                    NavigationLink(
                        destination: DementiaTestView(),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.purple)
                                Image("자가진단")
                                    .resizable()
                            }
                        }
                    )
                }
                HStack{
                    NavigationLink(
                        destination: GameView(),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.green)
                                Image("게임")
                                    .resizable()
                            }
                        }
                    )
                    //두 번 들어가면 렉 걸림
                    NavigationLink(
                        destination: CenterView(csv_content: csv_content),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.yellow)
                                Image("센터안내")
                                    .resizable()
                            }
                        }
                    )
                }
            }
            .background(Color.gray)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("처음화면")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear() {
            self.isNavigationBarHidden = true
        }
        .padding()
    }
}
