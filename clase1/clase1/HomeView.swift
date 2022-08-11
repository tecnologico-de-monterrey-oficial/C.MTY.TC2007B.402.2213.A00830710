//
//  ContentView.swift
//  clase1
//
//  Created by Alumno on 08/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack{
            Color.blue
            VStack{
                HStack{
                    Text("1")
                    Text("2")
                    Text("3")
                }
                Text("Hola Crayola")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(.largeTitle))
            }
        } .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
