//
//  BiometricManager.swift
//  DemoFaceIDAndTouchId
//
//  Created by Doch on 23/09/2024.
//

import Foundation
import LocalAuthentication

class BiometricManager{
    
    static var shared = BiometricManager()
    private init(){}
    
    private var context = LAContext()
    
    func isSupportBiometric()-> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    func biometricType() -> LABiometryType {
        return context.biometryType
    }
    
    func workwithbio(completionHandler: @escaping ()->Void?){
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This app work with Touch ID") { success, error in
            if success{
                completionHandler()
            }else{
                print("Error: \(error, default: "")")
            }
        }
    }
}
