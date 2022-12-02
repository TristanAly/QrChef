//
//  SignUpView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 01/12/2022.
//

import SwiftUI

struct SignUpView: View {
    // Importation VM
    // Variable Textfields
    @State var username: String = ""
    @State var email: String = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
       
            ZStack {
                
                VStack{
                    Spacer()
                    HStack {
                        Image(systemName: "person")
                        .foregroundColor(.secondary)
                        TextField("username", text: $username)
                    }
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .frame(width: 300, height: 40)
                    .cornerRadius(10)
                    .underlineTextField()
                    
                    HStack {
                        Image(systemName: "envelope.badge")
                        .foregroundColor(.secondary)
                        TextField("Email", text: $email)
                    }
                    .autocorrectionDisabled(true)
                    .textCase(.lowercase)
                    .textInputAutocapitalization(.never)
                    .frame(width: 300, height: 40)
                    .cornerRadius(10)
                    .underlineTextField()
                    
                    HStack {
                        Image(systemName: "key")
                        .foregroundColor(.secondary)
                        SecureField("password", text: $password)
                    }
                    .frame(width: 300, height: 40)
                    .cornerRadius(10)
                    .autocorrectionDisabled(true)
                    .underlineTextField()
                    
                    
                    
                    Spacer()
                    
                    Button {
                        // TODO: ACTION INSCRIPTION
                        Task {
                            
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
                
                .navigationTitle("Create an account")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
