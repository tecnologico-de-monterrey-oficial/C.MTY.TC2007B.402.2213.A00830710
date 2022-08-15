//
//  ContentView.swift
//  App01-MiPerfil
//
//

import SwiftUI

struct HomeView: View {
    
    @State var name: String = "Musel Tabares"
    @State var program: String = "ITC"
    @State var age: Double = 20
    @State var birthdate: Date = Date()
    @State var city: String = "Tijuana"
    @State var showView: Bool = false
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 0) {
                    ZStack {
                        Color.blue
                        VStack {
                            Text(name)
                                .foregroundColor(.white)
                                .font(.custom("Roboto-Bold", size: 40))
                        }
                    }
                    .frame(height: geo.size.height/3)
                    VStack {
                        Color.red
                    }
                    .frame(height: (geo.size.height / 3) * 2)
                }
                ZStack {
                    VStack {
                        Circle()
                            .padding(.bottom, geo.size.height/3)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    }
                    VStack {
                        Image("appstore")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 6)
                                    .foregroundColor(.white)
                            )
                            .padding(.bottom, geo.size.height/3)
                    }
                    VStack {
                        VStack {
                            TextView(label: "Carrera:", value: program)
                            TextView(label: "Edad:", value: String(format: "%0.f", age))
                            TextView(label: "Fecha Nacimiento", value: "\(dateFormat.string(from: birthdate))")
                            TextView(label: "Ciudad:", value: city)
                        }
                        Spacer()
                        Button {
                            showView.toggle()
                        } label: {
                            Text("Actualiza Datos")
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    .blue
                                )
                                .cornerRadius(20)
                                
                        }

                    }
                    .modifier(TextModifier())
                    .padding(.top, geo.size.height/3 + 100)
                    .padding(.bottom, 60)
                    
                }
            }
            .fullScreenCover(isPresented: $showView) {
                DataView(program: $program, age: $age, birthdate: $birthdate, city: $city)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
