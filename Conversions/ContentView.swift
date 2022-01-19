//
//  ContentView.swift
//  Conversions
//
//  Created by Maria Smirnova on 21/10/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var timeInput = 0.0
    @State private var inputUnit = 0
    @State private var outputUnit = 0
        
    
    let units1 = [1, 60, 360, 360*24]
    let units2 = [1, 60, 360, 360*24]
    
    
    
    var finalTime: Double {

        let incertedTime = Double(timeInput)
        let timeSelection = Double(inputUnit)
        let finalTimeSelection = Double(outputUnit)
        
        let basicTime = incertedTime * timeSelection
        let newTime = basicTime / finalTimeSelection
        
        return newTime

    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    if #available(iOS 15.0, *) {
                        TextField("Time input", value: $timeInput,  format:     .number)
                        //keyboardType(.decimalPad)
            
                        Picker("Unit of measurement", selection: $inputUnit) {
                            ForEach(units1, id: \.self) {
                                Text($0, format: .number)
                            }
                            
                        }
                        
                        .pickerStyle(.segmented)
            
                    } else {
                        // Fallback on earlier versions
                    }
            
                }
            
                Section {
                    if #available(iOS 15.0, *) {
                        
                        Picker("Unit of measurement2", selection: $outputUnit) {
                            ForEach(units2, id: \.self) {
                                Text($0, format: .number)
                            }
                            
                        }
                        
                        .pickerStyle(.segmented)
                        
                    } else {
                        // Fallback on earlier versions
                    }
                }
                
                Section {
                    if #available(iOS 15.0, *) {
                        Text(finalTime, format: .number)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
        }
        .navigationTitle("Time conversion")
    }
    
//    @State private var timeInput = 0.0
//
//    let second = 1.0
//    let minute = second * 60
//    let hour = minute * 60
//    let day = hour * 24
//
//    let units = [second, minute, hour, day]
//
//    @State private var inputUnit = String(second)
//    @State private var outputUnit = String(second)
//
//
//    var convertedTime: Double {
//
//    }
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
////                    TextField("Time incerted", value: $timeInput, format: .number)
//                        .keyboardType(.decimalPad)
//                    Picker("Time type", selection: $inputUnit) {
//                        ForEach(units, id: \.self) {
//                            Text($0, format: .number)
//                        }
//                    }
//                    pickerStyle(.segmented)
//                }
//                Section {
//                    Text()
//                    Picker("Time type", selection: $outputUnit) {
//                        ForEach(units, id: \.self) {
//                            Text($0, format: .number)
//                        }
//                    }
//                    pickerStyle(.segmented)
//                }
//            }
//            .navigationTitle("Time Convertion")
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
