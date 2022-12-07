//
//  ButtonReservationView.swift
//  QrChef
//
//  Created by apprenant1 on 06/12/2022.
//

import SwiftUI

struct ButtonReservationView: View {
    @Binding var reservation : Bool
    var body: some View {
        HStack{
            Button {
                reservation = false
            } label: {
                Text("Reservation")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
            Button {
                reservation = true
            } label: {
                Text("Show Menu")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal)
    }
}

struct ButtonReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonReservationView(reservation: .constant(false))
    }
}
