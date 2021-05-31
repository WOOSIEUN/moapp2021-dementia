//
//  DementiaTestView.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/31.
//

import SwiftUI

struct DementiaTestView: View {
    
    @State var testRound : Int = 1
    @State var testPoint : Int = 0
    
    let sentence: Array<String> = ["자신의 기억력에 문제가 있다고 생각하십니까?", "자신의 기억력이 10년전보다 나빠졌다고 생각하십니까?", "자신의 기억력이 같은 또래의 다른 사람들에 비해 나쁘다고 생각하십니까?", "기억력 저하로 인해 일상생활에 불편을 느끼십니까?", "최근에 일어난 일을 기억하는 것이 어렵습니까?", "며칠 전에 나눈 대화 내용을 기억하기 어렵습니까?", "며칠 전에 한 약속을 기억하기 어렵습니까?", "친한 사람의 이름을 기억하기 어렵습니까?", "물건 둔 곳을 기억하기 어렵습니까?", "이전에 비해 물건을 자주 잃어버립니까?", "집 근처에서 길을 잃은 적이 있습니까?", "가게에서 2-3가지 물건을 사려고 할 때 물건 이름을 기억하기 어렵습니까?", "가스불이나 전기불 끄는 것을 기억하기 어렵습니까?", "자주 사용하는 전화번호(자신 혹은 자녀의 집)를 기억하기 어렵습니까?"]
    
    var body: some View {
        VStack{
            ZStack{
                Text("\(testRound)/\(sentence.count)")
                    .font(Font.system(size: 50))
            }
            ZStack{
                RoundedRectangle(cornerRadius:10.0).fill(Color.white)
                Text(sentence[0])
                    .font(Font.system(size: 70))
                    .multilineTextAlignment(.center)
            }
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius:10.0).fill(Color.green)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        .foregroundColor(.black)
                    Text("네")
                        .font(Font.system(size: 70))
                        .foregroundColor(.black)
                }
                .padding(3)
                .onTapGesture {
                    //점수 올리기
                    //다음 질문으로
                }
                ZStack{
                    RoundedRectangle(cornerRadius:10.0).fill(Color.red)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        .foregroundColor(.black)
                    Text("아니오")
                        .font(Font.system(size: 70))
                        .foregroundColor(.black)
                }
                .padding(3)
                .onTapGesture {
                    //다음질문으로
                }
            }
        }
    }
}

struct DementiaTestView_Previews: PreviewProvider {
    static var previews: some View {
        DementiaTestView()
    }
}
