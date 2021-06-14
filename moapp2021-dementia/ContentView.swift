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
                                VStack{
                                    Image("Flower1")
                                    Text("치매 안내서")
                                        .foregroundColor(Color.black)
                                        .font(.system(size:80))
                                        .fontWeight(.black)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    )
                    NavigationLink(
                        destination: DementiaTestView(),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.purple)
                                Text("치매 자가 진단")
                                    .foregroundColor(Color.white)
                                    .font(.system(size:80))
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
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
                                Text("치매 예방 게임")
                                    .foregroundColor(Color.white)
                                    .font(.system(size:80))
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    )
                    //두 번 들어가면 렉 걸림
                    NavigationLink(
                        destination: CenterView(csv_content: csv_content),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:10.0).fill(Color.yellow)
                                Text("치매안심센터 안내")
                                    .foregroundColor(Color.white)
                                    .font(.system(size:80))
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
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
