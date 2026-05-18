//
//  TypeCall.swift
//  Chatbox
//
//  Created by admin on 15.05.2026.
//

import UIKit

enum TypeCall {
    case outgoing
    case incoming
    case missed
    
    var image: UIImage {
        get{
            switch(self){
            case .outgoing:
                return .outgoing
            case .incoming:
                return .incoming
            case .missed:
                return .missed
            }
        }
    }
    
    var color: UIColor {
        get{
            switch(self){
            case .outgoing:
                return .systemPurple
            case .incoming:
                return .accent
            case .missed:
                return .red
            }
        }
    }
}
