//
//  ArrayExtension.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/12.
//

import Foundation

extension Array {
    public init(generating elementGenerator: (Int) -> Element, count: Int){
        self = (0..<count).map(elementGenerator)
    }
}
