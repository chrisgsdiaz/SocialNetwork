//
//  Strings.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 10/04/23.
//

import Foundation

extension String {
    
    /// Función que determina si un email es válido
    /// - Returns : Bool
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}
