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
            
            VStack(alignment: .center)  {
                
                LottieView(lottieFile: "fork")
                    .frame(width: 200, height: 200)

                Text("Welcome to QRChef")
                    .foregroundColor(.redBurgundy)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                VStack{
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.secondary)
                        TextField("Email", text: self.$email)
                    }
                    .frame(width: 300, height: 40)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .applyBurgundiStyle()
                    
                    
                    HStack {
                        Image(systemName: "key")
                            .foregroundColor(.secondary)
                        SecureField("Password", text: self.$password)
                        
                    } .frame(width: 300, height: 40)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .applyBurgundiStyle()
                }
                
                .padding(35)
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
                    //MARK: Continue without an account
                }) {
                    Text("Continue without an account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color.redBurgundy)
                        .cornerRadius(15.0)
                }
                Spacer()
                HStack {
                    Text("Don't have an account ?")
                        .foregroundColor(.white)
                    Button {
                     //
                    } label: {
                        Text("Sign Up")
                        .foregroundColor(.white)
                        .bold()
                    }
                }
              

//                .sheet(isPresented: ) {
//                    SignUpView()
//                }
            } //.padding([.leading, .trailing], 27.5)
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


