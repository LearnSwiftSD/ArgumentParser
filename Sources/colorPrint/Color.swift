//
//  Color.swift
//  
//
//  Created by Stephen on 4/9/20.
//

import ArgumentParser
import Consler

/*
 `ExpressibleByArgument` Allows us to be able to use our custom types directly from the
 command-line so long as the adopting type can be converted from a `String`.
 */
enum Color: String, ExpressibleByArgument {
    
    case normal
    case red
    case green
    case blue
    case magenta
    case yellow
    case gray
    
    var conslerValue: TextColor {
        switch self {
        case .normal:
            return .normal
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .detailed(25)
        case .magenta:
            return .magenta
        case .yellow:
            return .yellow
        case .gray:
            return .darkGray
        }
    }
    
}
