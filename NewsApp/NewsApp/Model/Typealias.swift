//
//  Typealias.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/11.
//

import Foundation

typealias ListCompletion<T: Codable> = ([T]?,String,Int) -> ()

typealias DataCompletion<T: Codable> = (T?,String,Int) -> ()
