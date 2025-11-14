//
//  CustomColor.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI

enum CustomColor {
    case purpleBackground
    case purpleOutlineBackground
    
    var color: Color {
        switch self {
        case .purpleBackground:
            Color(red: 122/255, green: 2/255, blue: 90/255)
        case .purpleOutlineBackground:
            Color(red: 255/255, green: 108/255, blue: 216/255)
        }
    }
}
