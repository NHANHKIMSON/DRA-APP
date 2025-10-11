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
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "You need to unlock your phone with touch id") { success, error in
            if success{
                completionHandler()
            }else{
                print("Error: \(error, default: "")")
            }
        }
    }
}
