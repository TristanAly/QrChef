//
//  PreparationView.swift
//  QrChef
//
//  Created by Thibault GODEFROY on 30/11/2022.
//

import SwiftUI

struct PreparationView: View {
    var body: some View {
        
            VStack{
                Image("Restaurant")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
                    .ignoresSafeArea()
                
                ScrollView {
                    CommandesView(recipe: Recipe.example)
                        
                    CommandesView(recipe: Recipe.example)
                       
                    CommandesView(recipe: Recipe.example)
                        
                    CommandesView(recipe: Recipe.example)
                        
                    CommandesView(recipe: Recipe.example)
                        
                }
                
                .padding(.top, -50)
                ButtonServView()
            } 
    }
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationView()
    }
}
