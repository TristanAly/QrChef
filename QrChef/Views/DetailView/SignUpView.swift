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
                    TextField("Username", text: $username)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .frame(width: 300, height: 40)
                        .cornerRadius(10)
                     
                    
                    TextField("Email", text: $email)
                        .autocorrectionDisabled(true)
                        .textCase(.lowercase)
                        .textInputAutocapitalization(.never)
                        .frame(width: 300, height: 40)
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .frame(width: 300, height: 40)
                        .cornerRadius(10)
                        .autocorrectionDisabled(true)
                    Spacer()
                    
                    Button {
                        // TODO: ACTION INSCRIPTION
                        Task {
                            
                        }
                    } label: {
                        Text("insciption")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .foregroundStyle(.linearGradient(colors: [.cyan, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                            .foregroundColor(.white)
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
