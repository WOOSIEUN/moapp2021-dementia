//
//  DementiaGuideView.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/31.
//

import SwiftUI

struct DementiaGuideView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                Text("힘이 되는 치매 안내서")
                    .font(.system(size:80))
                    .fontWeight(.black)
                    .padding(20)
                
                ScrollView {
                    Group {
                        ListHeader(title: "치매 바로알기!", bgColor: Color.purple)
                        
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide1"),
                            label: {
                                ListItem(title: "치매 알아보기", strokeColor: Color.purple)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide2"),
                            label: {
                                ListItem(title: "치매 단계별 증상", strokeColor: Color.purple)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide3"),
                            label: {
                                ListItem(title: "치매 조기발견과 지속치료의 중요성", strokeColor: Color.purple)
                            }
                        )
                    }
                    
                    Group {
                        ListHeader(title: "치매가 걱정되세요?", bgColor: Color.yellow)
                        
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide4"),
                            label: {
                                ListItem(title: "치매 예방 수칙", strokeColor: Color.yellow)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide5"),
                            label: {
                                ListItem(title: "세대별 치매 예방 액션플랜", strokeColor: Color.yellow)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide6"),
                            label: {
                                ListItem(title: "치매 예방 인지훈련 - 두근두근 뇌운동", strokeColor: Color.yellow)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide7"),
                            label: {
                                ListItem(title: "치매 안심 센터", strokeColor: Color.yellow)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide8"),
                            label: {
                                ListItem(title: "치매 조기검진 사업", strokeColor: Color.yellow)
                            }
                        )
                    }
                    
                    Group {
                        ListHeader(title: "치매로 진단 받으셨나요?", bgColor: Color.blue)
                        
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide9"),
                            label: {
                                ListItem(title: "치매 환자 지원 사업", strokeColor: Color.blue)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide10"),
                            label: {
                                ListItem(title: "치매 상담 콜센터", strokeColor: Color.blue)
                            }
                        )
                    }
                    
                    Group{
                        ListHeader(title: "치매, 지혜롭게 극복합시다!", bgColor: Color.green)
                        
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide11"),
                            label: {
                                ListItem(title: "치매돌봄 10계명", strokeColor: Color.green)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide12"),
                            label: {
                                ListItem(title: "치매 환자와의 대화 방법", strokeColor: Color.green)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide13"),
                            label: {
                                ListItem(title: "치매 가족 및 보호자 지원 사업", strokeColor: Color.green)
                            }
                        )
                        NavigationLink(
                            destination: DementiaGuideContentsView(filename: "Guide14"),
                            label: {
                                ListItem(title: "치매 관련 시설을 고르는 방법", strokeColor: Color.green)
                            }
                        )
                    }
                    Text("해당 자료는 중앙치매센터의 '2020 나에게 힘이 되는 치매가이드북'을 기반으로 제작되었습니다.")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct DementiaGuideView_Previews: PreviewProvider {
    static var previews: some View {
        DementiaGuideView()
    }
}
