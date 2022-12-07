//
//  LoginView.swift
//  QrChef
//
//  Created by apprenant1 on 04/12/2022.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM : LoginViewModel
    
    var body: some View {
        switch loginVM.newPage {
        case .page1:
            TabBarView()
        case .page2:
            SignInView(loginVM: loginVM)
        case .page3:
            EmptyView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginVM: LoginViewModel())
    }
}
