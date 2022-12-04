////
////  RowRestaurantView.swift
////  QrChef
////
////  Created by apprenant1 on 01/12/2022.
////
//
//import SwiftUI
//
//struct RowRestaurantView: View {
//    var manager : Manager
//    var body: some View {
//        HStack{
////            AsyncImage(url: URL(string: manager.image ?? "")) { image in
//            AsyncImage(url: URL(string: "")) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 70 , height: 70)
//            } placeholder: {
//                ProgressView()
//            }
//            .padding()
//            Spacer()
//            VStack(alignment: .leading){
//                Text(manager.restaurant ?? "no restaurant")
//                    .font(.title)
//                Text(manager.address ?? "test")
//            }
//            .padding()
//            Spacer()
//        }
//    }
//}
//
//struct RowRestaurantView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowRestaurantView(manager: Manager.example)
//    }
//}
