//
//  AppFontStyle.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 01/01/23.
//

import Foundation
import SwiftUI

extension Font {
    public static func title() -> Font{
        return Font.system(size: 24, weight: Font.Weight.bold)
    }
    
    public static func regular() -> Font{
        return Font.system(size: 14, weight: Font.Weight.regular)
    }
    
    public static func button() -> Font{
        return Font.system(size: 16, weight: Font.Weight.semibold)
    }
}
