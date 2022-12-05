//
//  SignInView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 01/12/2022.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var loginVM : LoginViewModel
    
    var body: some View {
        NavigationStack{
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
                    
                    Group{
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.secondary)
                            TextField("Email", text: self.$loginVM.username)
                        }
                        HStack {
                            Image(systemName: "key")
                                .foregroundColor(.secondary)
                            SecureField("Password", text: self.$loginVM.password)
                        }
                    }
                    .frame(width: 300, height: 40)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .applyBurgundiStyle()
                    .modifier(ShakeEffect(animatableData: CGFloat(
                        loginVM.invalidAttempts)))
                    .padding(5)
                    VStack{
                        Group{
                            Button (action: {
                                //MARK: SignIn
                                Task{
                                    loginVM.signin = try await loginVM.signIn(username: loginVM.username ,password: loginVM.password)
                                    
                                    print("\(String(describing: loginVM.signin?.accessToken))")
                                    
                                    if loginVM.show {
                                        loginVM.showAlert = false
                                        print("New View success!!")
                                        self.loginVM.invalidAttempts = 0
                                        loginVM.newPage = true
                                        
                                    } else {
                                        loginVM.showAlert = true
                                        withAnimation(.default) {
                                            self.loginVM.invalidAttempts += 1
                                        }
                                    }
                                }
                            }) {
                                Text("Sign In")
                            }
                            NavigationLink{
                                //MARK: Continue without an account
                                RestaurantList()
                                
                            } label: {
                                Text("Continue without an account")
                                
                            }
                            
                        }.font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 45)
                            .background(Color.redBurgundy)
                            .cornerRadius(15.0)
                    }.padding(.vertical,30)
                    Spacer()
                    HStack {
                        Text("Don't have an account ?")
                            .foregroundColor(.white)
                        Button {
                            loginVM.showSheet.toggle()
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    
                    
                    .sheet(isPresented: $loginVM.showSheet ) {
                        SignUpView(loginVM: loginVM)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(loginVM: LoginViewModel())
    }
}


