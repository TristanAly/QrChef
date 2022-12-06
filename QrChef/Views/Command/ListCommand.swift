//
//  ListCommand.swift
//  QrChef
//
//  Created by apprenant1 on 05/12/2022.
//

import SwiftUI

struct ListCommand: View {
    
    @StateObject var vm = CommandViewModel()
    
    var body: some View {
        VStack{
            List{
//                ForEach(vm.command, id: \.table) { command in
//                    VStack{
//                        HStack{
//                            Text("Table n° \(command.table ?? "")")
//                            Spacer()
//
//                            Text("\(command.nbperson ?? 0) pers.")
//                        }
//                        ForEach(command.recipes ?? [], id: \.id) { recipe in
//                            HStack{
//                                Text(recipe.name ?? "")
//                                Spacer()
//                                Text("\(recipe.priceRange ?? 0)")
//                            }
//
//                        }
//                    }
//                }
                VStack{
                    HStack{
                        Text(vm.commands.table ?? "")
                        Text("\(vm.commands.price ?? 0)")
                    }
                    ForEach(vm.commands.recipes ?? [], id: \.id) { recipe in
                        HStack{
                            Text(recipe.name ?? "")
                            Spacer()
                            Text("\(recipe.priceRange ?? 0)")
                        }
                    }
                }
            }
        }
        .onAppear{
            Task {
                 vm.command = try await vm.getCommands()
            }
        }
    }
}

struct ListCommand_Previews: PreviewProvider {
    static var previews: some View {
        ListCommand()
            .environmentObject(CommandViewModel())
    }
}
