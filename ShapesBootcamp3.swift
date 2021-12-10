//
//  ShapesBootcamp3.swift
//  BootCamp
//
//  Created by Bob Bulliard on 11/29/21.
//

import SwiftUI

struct ShapesBootcamp3: View {
  
    var body: some View {
     
        Circle()
            .fill(/*@START_MENU_TOKEN@*/Color(hue: 0.527, saturation: 0.734, brightness: 0.773)/*@END_MENU_TOKEN@*/)
            .frame(width: 110, height: 110)
        
            
            
            
            
            
            
            
      
          //  .background(Color.init(CGColor.init(srgbRed: 5, green: 5, blue: 95, //alpha: 5)))
           
                            
          // .stroke(.blue)
           // .stroke(lineWidth: 45)
         //   .stroke(Color.blue, style: StrokeStyle(lineWidth: 22, lineCap: .butt, dash: [10]))
        //from 1 to 1 means a full circle. from .9 is a very small part of circle
        // you could do progression circle with this
       //.trim(from: 0.9, to: 1.0)
       //     .stroke(Color.purple,lineWidth: 50)
    }
}

struct ShapesBootcamp3_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp3()
    }
}
