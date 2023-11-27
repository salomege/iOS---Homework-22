//
//  News.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation
// აქ აკლდა Decodable
struct News: Decodable {
    let author: String?
    let title: String?
    let urlToImage: String?
}
