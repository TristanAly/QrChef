//
//  SignUpView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 01/12/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var loginVM : LoginViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            Text("Create an account")
                .foregroundColor(.redBurgundy)
                .font(.title2)
            Spacer()
            Group{
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("username", text: $loginVM.username)
                }
                .textInputAutocapitalization(.never)
                
                HStack {
                    Image(systemName: "envelope.badge")
                        .foregroundColor(.secondary)
                    TextField("Email", text: $loginVM.email)
                }
                .textCase(.lowercase)
                .textInputAutocapitalization(.never)
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.secondary)
                    SecureField("password", text: $loginVM.password)
                }
            }
            .frame(width: 300, height: 40)
            .cornerRadius(10)
            .autocorrectionDisabled(true)
            .underlineTextField()
            
            Spacer()
            
            Button {
                Task{
                    try await loginVM.signUp(userName: loginVM.username, email: loginVM.email, password: loginVM.password)
                }
                Task{
                    dismiss()
                }
            } label: {
                Text("insciption")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 45)
                    .background(Color.redBurgundy)
                    .cornerRadius(15.0)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(loginVM: LoginViewModel())
    }
}
