//
//  imageStyle.swift
//  imageGeneratorApp
//
//  Created by ryananda on 29/05/23.
//

import Foundation

enum imageStyle: String, CaseIterable {
    case surrealism
    case abstract
    case realism
    case threeDRender
    case minimalism
    case retro
    case geometric
    
    var title: String {
        switch self {
        case .surrealism :
            return "surrealism"
        case .abstract:
            return "abstract"
        case .realism:
            return "realism"
        case .threeDRender:
            return "threeDRender"
        case .minimalism:
            return "minimalism"
        case .retro:
            return "retro"
        case .geometric:
            return "geometric"
        }
    }
}
