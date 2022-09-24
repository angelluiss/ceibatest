//
//  UIAplication.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
