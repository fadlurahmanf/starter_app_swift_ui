//
//  Failure.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 31/12/22.
//

import Foundation

extension HTTPURLResponse{
    func toCustomExtension() -> CustomException{
        if(self.statusCode == 404){
            return CustomException(rawMessage: "NOT_FOUND")
        }
        return CustomException(rawMessage: "GENERAL")
    }
}
