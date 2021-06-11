//
//  DementiaGuideContentsView.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/06/12.
//

import Foundation
import SwiftUI

struct DementiaGuideContentsView: View {
    var filename: String
    
    var body: some View{
        InternalView(Model(filename: self.filename))
    }
}

struct InternalView: View {
    @ObservedObject var model: Model

    init(_ Model: Model) {
        self.model = Model
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                ForEach(model.dataArr, id: \.self) { dataStr in
                    if (dataStr != "") {
                        let index = dataStr.index(dataStr.startIndex, offsetBy:1)
                        if (dataStr[dataStr.startIndex] == "#") {
                            Text(dataStr[index ..< dataStr.endIndex])
                                .fontWeight(.bold)
                                .font(Font.system(size: 100))
                                .foregroundColor(.black)
                        } else if (dataStr[dataStr.startIndex] == "$") {
                            Text(dataStr[index ..< dataStr.endIndex])
                                .font(Font.system(size: 60))
                                .foregroundColor(.black)
                                .padding()
                        } else if (dataStr[dataStr.startIndex] == "%") {
                            Text(dataStr[index ..< dataStr.endIndex])
                                .font(Font.system(size: 40))
                                .foregroundColor(.black)
                                .lineSpacing(10)
                                .padding(12)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

class Model: ObservableObject {
    @Published var data: String = ""
    @Published var dataArr: Array<String> = []
    
    init(filename: String) {
        self.load(file: filename)
    }
    
    func load(file: String) {
        if let filepath = Bundle.main.path(forResource: file, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                DispatchQueue.main.async {
                    self.data = contents
                    self.dataArr = self.data.components(separatedBy: .newlines)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
    
}


struct DementiaGuideContentsView_Previews: PreviewProvider {
    static var previews: some View {
        DementiaGuideContentsView(filename: "Guide1")
    }
}
