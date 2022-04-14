//
//  PickerBootcamp.swift
//  BootCamp
//
//  Created by Bob Bulliard on 12/9/21.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = ""
    var body: some View {
        VStack{
            HStack{
        Text("Select Age Below:")
                    .foregroundColor(.white)
            Text(selection)
                    .foregroundColor(.white)
            }
            
            .frame(width: 240, height: 40)
            .font(.title2)
            .background(Color.blue)
            .cornerRadius(30)
        Picker(
            selection: $selection,
               label: Text("age:"),
               content: {
                   ForEach(1..<100) { number in
                       Text("\(number)")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .frame(width: 100, height: 100)
                       .tag("\(number)")
                   }
                   }
              
        )
                .pickerStyle(MenuPickerStyle())
             
                .background(Color.white)
            }
        
               }
       
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
