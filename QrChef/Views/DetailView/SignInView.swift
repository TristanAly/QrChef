//
//  SignInView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 01/12/2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            Color.redBurgundy
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(.white)
                .frame(width: 395, height: 420)
                .cornerRadius(20)
            //  .offset(y: -120)
            
            VStack(alignment: .center, spacing: 10)  {
                Text("Welcome to QRChef")
                    .foregroundColor(.redBurgundy)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
           
                TextField("Email", text: self.$email)
                    .frame(width: 300, height: 40)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                   
                    .applyBurgundiStyle()

                
                SecureField("Password", text: self.$password)
                    .frame(width: 300, height: 40)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                   // .padding(.horizontal, 8)
                    .applyBurgundiStyle()
                   // .textFieldStyle(.burgundy)
                    
                Button (action: {
                    //MARK: SignIn
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color.redBurgundy)
                        .cornerRadius(15.0)
                }
                
            Button (action: {
                //MARK: SignUP
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 45)
                    .background(Color.redBurgundy)
                    .cornerRadius(15.0)
            }
            }.padding([.leading, .trailing], 27.5)
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


