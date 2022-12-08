//
//  ProfilView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct ProfilView: View {
    @State var document: FilesDocuments
    @State private var image: Image? = nil
    @State private var isImagePickerShown = false
    @State private var inputImage: UIImage? = nil
    @State private var sourceType = UIImagePickerController.SourceType.photoLibrary
    
    @StateObject var userVM = UserViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @StateObject var commandVM = CommandViewModel()
    @State var arraytest = ["gdgdggd","gfgfdhq", "fggdhfdgh"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Spacer()
                if image != nil {
                    HStack{
                        image!
                            .resizable()
                            .frame(width: 170, height: 170)
                            .cornerRadius(40)
                        
                        Text(userVM.user.username)
                            .font(.title)
                            .bold()
                            .padding()
                        Spacer()
                    }
                } else {
                    HStack{
                        Rectangle()
                            .frame(width: 170, height: 170)
                            .cornerRadius(40)
                            .foregroundColor(.gray)
                        
                        Text(userVM.user.username)
                            .font(.title)
                            .bold()
                            .padding()
                        Spacer()
                    }
                }
                Button("Choose an image") {
                    self.sourceType = .photoLibrary
                    self.isImagePickerShown = true
                }
                .buttonStyle(GradientBackgroundStyle())
                
                Button("Take a picture") {
                    self.sourceType = .camera
                    self.isImagePickerShown = true
                }
                .buttonStyle(GradientBackgroundStyle())
                Spacer()
                Text("Mes bons de commande")
                    .font(.title2)
                    .padding()
                LazyVGrid(columns: columns) {
                    ForEach(commandVM.command) { index in
                        NavigationLink{
                            GeneratorQRCode(document: FilesDocuments(message: "Commande n° \(commandVM.commands.id)\n avec \(commandVM.commands.nbperson!) pers.\n Burrata        8€\n Burger         12.50€\n \(String(describing: commandVM.commands.userId))\n \(String(describing: commandVM.commands.date)) à \(String(describing: commandVM.commands.hour))"))
                        } label: {
                            VStack{
                                Image(uiImage: generateQRCode(from: document.message))
                                    .interpolation(.none)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }.onAppear{
                        Task{
                            commandVM.command = try await commandVM.getCommands()
                        }
                    }
                }
                Spacer()
            }.sheet(isPresented: $isImagePickerShown, onDismiss: loadImage) {
                ImagePicker(inputImage: self.$inputImage, sourceType: self.sourceType)
            }.padding()
                .onAppear{
                    Task{
                        userVM.user = try await userVM.getUser()
                    }
                }
        }
    }
        func loadImage() {
            guard let inputImage = inputImage else { return }
            image = Image(uiImage: inputImage)
        }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(document: FilesDocuments(message: ""))
            .environmentObject(UserViewModel())
    }
}

struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.redBurgundy, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
    }
}



//                HStack{
//                    // ajout UIImage picker
//                    Circle()
//                        .frame(width: 170, height: 170)
//
//                    Text(userVM.user.username)
//                        .font(.title)
//                        .bold()
//                        .padding()
//                    Spacer()
//                }
