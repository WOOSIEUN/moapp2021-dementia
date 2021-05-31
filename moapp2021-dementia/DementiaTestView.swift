//
//  DementiaTestView.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/31.
//

import SwiftUI

struct DementiaTestView: View {
    
    @State var tag:Int? = nil
    @State var testRound : Int = 1
    @State var testPoint : Int = 0
    @State var isComplete: Bool = false
    
    let sentence: Array<String> = ["자신의 기억력에 문제가 있다고 생각하십니까?", "자신의 기억력이 10년전보다 나빠졌다고 생각하십니까?", "자신의 기억력이 같은 또래의 다른 사람들에 비해 나쁘다고 생각하십니까?", "기억력 저하로 인해 일상생활에 불편을 느끼십니까?", "최근에 일어난 일을 기억하는 것이 어렵습니까?", "며칠 전에 나눈 대화 내용을 기억하기 어렵습니까?", "며칠 전에 한 약속을 기억하기 어렵습니까?", "친한 사람의 이름을 기억하기 어렵습니까?", "물건 둔 곳을 기억하기 어렵습니까?", "이전에 비해 물건을 자주 잃어버립니까?", "집 근처에서 길을 잃은 적이 있습니까?", "가게에서 2-3가지 물건을 사려고 할 때 물건 이름을 기억하기 어렵습니까?", "가스불이나 전기불 끄는 것을 기억하기 어렵습니까?", "자주 사용하는 전화번호(자신 혹은 자녀의 집)를 기억하기 어렵습니까?"]
    
    var body: some View {
        VStack{
            ZStack{
                Text("\(testRound)/\(sentence.count)")
                    .font(Font.system(size: 50))
            }
            ZStack{
                RoundedRectangle(cornerRadius:10.0).fill(Color.white)
                Text(sentence[testRound-1])
                    .font(Font.system(size: 70))
                    .multilineTextAlignment(.center)
                    .padding(30)
            }
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius:10.0).fill(Color.green)
                    RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 3)
                        .foregroundColor(.black)
                    Text("네")
                }
                .padding(3)
                .onTapGesture {
                    testPoint += 1;
                    if (testRound < 14) {
                       testRound += 1;
                    } else {
                        isComplete = true
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius:10.0).fill(Color.red)
                    RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 3)
                        .foregroundColor(.black)
                    Text("아니오")
                }
                .padding(3)
                .onTapGesture {
                    if (testRound < 14) {
                       testRound += 1;
                    } else {
                        isComplete = true
                    }
                }
            }
            .font(Font.system(size: 50))
            .padding(15)
            .frame(height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ZStack {
                if isComplete {
                    NavigationLink(
                        destination: DementiaTestResultView(testScore: self.$testPoint),
                        label: {
                            Text("완료")
                                .font(Font.system(size: 50))
                                .foregroundColor(.black)
                        })
                }
            }
        }
    }
}

struct DementiaTestResultView: View {
    
    @Binding var testScore : Int
    
    var body: some View {
        VStack{
            Text("검사결과")
                .font(Font.system(size: 100))
                .foregroundColor(.black)
            Spacer()
            if testScore > 5 {
                Text("치매 위험이 있습니다.")
                    .font(Font.system(size: 90))
                    .foregroundColor(.red)
                Spacer()
                Spacer()
                Text("주소지 관할 치매안심센터를 방문하셔서 더 정확한 검진을 받아보시기 바랍니다.")
                    .font(Font.system(size: 50))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(30)
            } else {
                Text("정상입니다!")
                .font(Font.system(size: 90))
                .foregroundColor(.green)
                Spacer()
                Spacer()
                Text("운동과 외부 사회활동을 유지하고 치매예방수칙 3·3·3을 잘 실천하여 치매를 예방하세요.\n 더 정확한 검진을 원하신다면 주소지 관할 치매안심센터를 방문해주세요.")
                    .font(Font.system(size: 50))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(30)
            }
            Spacer();Spacer();Spacer()
            Text("참고문헌 : Youn, J.C., Kim, K.W., Lee, D.Y., Jhoo, J.H., Lee, S.B., Park, J.H., ...&Woo, J.I.(2009).Development of the subjective memory complaints questionnaire. Dementia and geriatric cognitive disorders, 27(4), 310-317.\n출처 : 중앙치매센터 『치매자가진단』")
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(30)
        }
    }
}

struct DementiaTestView_Previews: PreviewProvider {
    static var previews: some View {
        DementiaTestView()
    }
}
