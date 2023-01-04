//
//  CustomException.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 31/12/22.
//

import Foundation

struct CustomException:Decodable, Error{
    var properMessage:String?
    var rawMessage:String?
    var statusCode:String?
    
    private enum CodingKeys:String,CodingKey{
        case properMessage = "properMessage"
        case rawMessage = "rawMessage"
    }
}
