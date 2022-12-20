//
//  ContentView.swift
//  BetterRest
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    static
    var defaultWakeTime:Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                Section{
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
               
                Section{
//                    Stepper(coffeAmount == 1 ? "1 cup" : "\(coffeAmount) cups", value: $coffeAmount, in: 1...20)
                    //para o desafio do projeto 4
                    Picker("Number of cups", selection: $coffeAmount){
                        ForEach(1..<20){
                            Text("\($0) cups")
                        }
                    }
                }header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedTime)
            }
        }
    }
    func calculateBedTime(){
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
