//
//  DementiaTestM.swift
//  moapp2021-dementia
//
//  Created by EUN on 2021/05/26.
//

import SwiftUI

struct DementiaTestM<ItemContent> {
    
    var testItems: Array<TestItem>
    
    func chooseTrue(testItem: TestItem) {
        print("Item chosen: \(testItem) true")
    }
    
    func chooseFalse(testItem: TestItem) {
        print("Item chosen: \(testItem) false")
    }
    
    init(cntItem: Int, itemContent: (Int) -> ItemContent) {
        testItems = Array<TestItem>()
        for index in 0 ..< cntItem {
            let content: ItemContent = itemContent(index)
            testItems.append(TestItem(isTrue: nil, content: content, id: index))
        }
    }
    
    struct TestItem: Identifiable {
        var isTrue: Bool? = true
        var content: ItemContent
        var id: Int
    }
}
