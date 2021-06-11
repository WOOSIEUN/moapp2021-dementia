//
//  Alert.swift
//  GAME_TicTacToe
//
//  Created by 최수아 on 2021/06/10.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin    = AlertItem(title: Text("이겼어요!"), message: Text("승리를 축하합니다:)"), buttonTitle: Text("다시 시작하기"))
    static let computerWin = AlertItem(title: Text("졌어요ㅠ"), message: Text("다시 도전해보세요!"), buttonTitle: Text("다시 시작하기"))
    static let draw        = AlertItem(title: Text("비겼어요!"), message: Text("다시 도전해보세요!"), buttonTitle: Text("다시 시작하기"))
}
