//
//  Format.swift
//  
//
//  Created by Stephen on 4/9/20.
//

import ArgumentParser
import Consler

enum Format: String, ExpressibleByArgument {
    
    case normal
    case bold
    case underline
    case inverted
    case blink
    case hidden
    
    var conslerValue: TextFormat? {
        switch self {
        case .normal:
            return nil
        case .bold:
            return .bold
        case .underline:
            return .underline
        case .inverted:
            return .invert
        case .blink:
            return .blink
        case .hidden:
            return .hidden
        }
        
    }

}
