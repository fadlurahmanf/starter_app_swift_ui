//
//  NetworkState.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 02/01/23.
//

import Foundation

enum NetworkState <T> {
    case IDLE
    case LOADING
    case SUCCESS(T)
    case FAILED(CustomException)
    
    var description:String {
        switch self {
        case .IDLE: return "IDLE"
        case .LOADING: return "LOADING"
        case .SUCCESS(_): return "SUCCESS"
        case .FAILED(_): return "FAILED"
        }
    }
}
