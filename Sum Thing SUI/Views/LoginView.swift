//
//  LoginView.swift
//  Sum Thing SUI
//
//  Created by Swayam on 25/07/23.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @State public var isUnlocked = false
    @State public var errorMessage = ""
    
    var body: some View {
        VStack {
            if isUnlocked {
                ContentView()
            } else {
                Text("Expense Tracker Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Image("AppIcon")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                
                Button("Unlock with Fingerprint") {
                    authenticateWithFingerprint()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .onAppear {
            authenticateWithFingerprint()
        }
    }
    func authenticateWithFingerprint() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to access the Expense Tracker app"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        isUnlocked = true
                    } else {
                        errorMessage = "Authentication failed. Please try again."
                    }
                }
            }
        } else {
            errorMessage = "Fingerprint authentication is not available on this device."
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
