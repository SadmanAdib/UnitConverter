//
//  ContentView.swift
//  UnitConvertor
//
//  Created by Sadman Adib on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0.0
    @State private var inputSelection = "kilometers"
    @State private var outputSelection = "meters"
    
    @FocusState private var isFocused : Bool
    
    
    let Options = ["meters", "kilometers"]
    
    var outputValue : Double {
        if(inputSelection == "kilometers" && outputSelection == "meters"){
            return inputValue*1000
        }
        else if(inputSelection == "meters" && outputSelection == "kilometers"){
            return inputValue/1000
        }
        else{
            return inputValue
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Amount", value: $inputValue, format: .number).keyboardType(.decimalPad)
                    
                    Picker("Input Options", selection: $inputSelection){
                        ForEach(Options, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                }header: {
                    Text("Input Value")
                }.focused($isFocused)
                
                
                Section{
                    
                    Picker("Output Options", selection: $outputSelection){
                        ForEach(Options, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text(outputValue, format: .number)
                
                }header: {
                    Text("Converted value")
                }
                
                
            }.navigationTitle("UnitConvertor").navigationBarTitleDisplayMode(.inline)
        }.toolbar{
            ToolbarItemGroup(placement: .keyboard){
                Button("Done"){
                    isFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
