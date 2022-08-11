//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by Alumno on 11/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var name: String = "Musel Tabares"
    @State var program:String = "ITC"
    @State var age:String = "20"
    @State var birthdate:String = "5"
    @State var city:String = "Tijuana"
    
    
    @State var showview:Bool = false
    
    
    var body: some View {
        GeometryReader{geo in
            
            ZStack{
                VStack(spacing: 0){
                    ZStack{
                        Color.blue
                        VStack{
                            Text(name)
                                .foregroundColor(.white)
                                 .font(.custom("Roboto-Bold", size: 40))
                        }
                        
                    }
                    .frame(height: geo.size.height/3)
                    VStack{ Color.red}
                        .frame(height: geo.size.height/3*2)
                    
                }
                
                ZStack {
                    VStack{
                        //Circle()
                          //  .frame(width: 200)
                            //.padding(.bottom,geo.size.height/3)
                    }
                    VStack {
                        Image("image1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .clipShape( Circle())
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 6)
                                    .foregroundColor(.white)
                            )
                        .padding(.bottom,geo.size.height/3)
                    }
                    VStack{
                        VStack{
                            TextView(label: "carrera", value: program)
                            TextView(label: "edad", value: age)
                            TextView(label: "nacimiento", value: birthdate)
                            TextView(label: "ciudad", value: city)
                            
                        
                        //  \(age)
                        Spacer()
                        Button {
                            name = "Musel"
                            
                        }
                        label: {Text("Cambia Nombre")}
                            .foregroundColor(.white)
                            .padding()
                            .background(.cyan)
                            .cornerRadius(20)
                        
                        
                        
                    }
                    
                }
                    //.modifier(TextModifier)
                .padding(.top,geo.size.height/3)
                .padding(.bottom,60)
            }
        }
            
            
            //.sheet(.isPresented: $showview){
            //dataview()
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
