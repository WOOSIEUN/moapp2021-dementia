//
//  GameView.swift
//  GAME_TicTacToe
//
//  Created by 최수아 on 2021/06/10.
//

import SwiftUI

struct GameView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isGameboardDisabled = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Text("슬라이딩 퍼즐 게임").fontWeight(.heavy)
                    .frame(width: 500, height: 15, alignment: .topLeading)
                    .font(.system(size:40))
                    //.padding(.top, 50)
                    .padding(.leading, 90)
                Text("가로, 세로, 대각선으로 한 줄을 완성하면 이겨요!!")
                    .font(.system(size:30))
                    .padding(.top, 30)
                    .padding(.leading, -100)
            }
            .padding(EdgeInsets(top: 0, leading: 440, bottom: 0, trailing: 0))
            
            VStack{
                Spacer()
                LazyVGrid(columns: columns) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray).opacity(0.5)
                                .frame(width: geometry.size
                                        .width/3 - 250, height: geometry.size.width/3 - 250)
                                .cornerRadius(60)
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            if isSquareOccupied(in: moves, forIndex: i) { return }
                            moves[i] = Move(player: .human, boardIndex: i)
                            
                            if checkWinCondition(for: .human, in: moves){
                                alertItem = AlertContext.humanWin
                                return
                            }
                            
                            if checkForDraw(in: moves){
                                alertItem = AlertContext.draw
                                return
                            }
                            isGameboardDisabled = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                let computerPosition = determineComputerMovePosition(in: moves)
                                moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                isGameboardDisabled = false
                                
                                if checkWinCondition(for: .computer, in: moves){
                                    alertItem = AlertContext.computerWin
                                    return
                                }
                                
                                if checkForDraw(in: moves){
                                    alertItem = AlertContext.humanWin
                                    return
                                }
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 360, bottom: 0, trailing: 360))
                Spacer()
            }
            .disabled(isGameboardDisabled)
            .alert(item: $alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {resetGame()}))
            })
            Button(action: {
                        self.resetGame()
            }) {
                HStack{
                    //Image(systemName: "goforward")
                    Text("다시 시작하기")
                        .font(.system(size:30))
                }
                .padding(10.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0)
                )
            }
            .padding(EdgeInsets(top: 790, leading: 580, bottom: 0, trailing: 0)) 
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        let computerMoves = moves.compactMap {$0}.filter{$0.player == .computer}
        let computerPositions = Set(computerMoves.map {$0.boardIndex})
        
        for pattern in winPatterns {
            let winPosition = pattern.subtracting(computerPositions)
            
            if winPosition.count == 1 {
                let isAvaiable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvaiable{ return winPosition.first!}
            }
        }
        let humanMoves = moves.compactMap {$0}.filter{$0.player == .human}
        let humanPositions = Set(humanMoves.map{$0.boardIndex})
        
        for pattern in winPatterns {
            let winPosition = pattern.subtracting(humanPositions)
            
            if winPosition.count == 1{
                let isAvaiable = !isSquareOccupied(in: moves, forIndex: winPosition.first! )
                if isAvaiable{ return winPosition.first! }
            }
        }
        
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare){
            return centerSquare
        }
        
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        let playerMoves = moves.compactMap{$0}.filter{$0.player == player}
        let playerPositions = Set(playerMoves.map {$0.boardIndex})
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap{$0}.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }

}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String{
        return player == .human ? "xmark" : "circle"
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
