//
//  DataView.swift
//  App01-MiPerfil
//
//

import SwiftUI

struct DataView: View {
    
    // Para cerrar una ventana
    @Environment(\.presentationMode) var presentationMode
    @Binding var program: String
    @Binding var age: Double
    @Binding var birthdate: Date
    @Binding var city: String
    
    @State var backgroundColor: Color = .blue
    
    
    var cities: [String] = ["Tijuana", "Monterrey", "Campeche"]
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack {
            changeBackgroundColor(age: age)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Regresar")
                            .foregroundColor(.white)
                    }
                }
                .padding(.trailing, 30)
                Spacer()
            }
            .padding(.top, 50)
            VStack {
                Text("Actualiza los Datos")
                Text("Carrera")
                TextField("Carrera", text: $program)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Edad \(age, specifier: "%0.0f")")
                Slider(value: $age, in: 16...60, step: 1)
                // DatePicker
                DatePicker(selection: $birthdate, in: ...Date(), displayedComponents: .date) {
                    Text("\(dateFormat.string(from: birthdate))")
                }
                // Picker
                Picker(selection: $city, label:
                        Text("Ciudad")
                ){
                    ForEach(cities, id: \.self) { city in
                        Text(city)
                    }
                }
                
            }
            .padding(.horizontal, 30)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func changeBackgroundColor(age: Double) -> Color {
        if age <= 30 {
            return Color.blue
        } else {
            if age >= 50 {
                return Color.orange
            }
        }
        return Color.green
    }
    
}

struct DataView_Previews: PreviewProvider {
    
    @State static var program: String = "ITC"
    @State static var age: Double = 20
    @State static var birthdate: Date = Date()
    @State static var city: String = "Monterrey"
    
    
    static var previews: some View {
        DataView(program: $program, age: $age, birthdate: $birthdate, city: $city)
    }
}
