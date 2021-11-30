//
//  Gradients_Bootcamp5.swift
//  BootCamp
//
//  Created by Bob Bulliard on 11/29/21.
//

import SwiftUI

struct Gradients_Bootcamp5: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0 )

            .fill(
     //   LinearGradient(gradient:Gradient(colors:
      //                                      [Color.red, Color.blue]), //startPoint:
       //                     .leading, endPoint: .trailing)
                RadialGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                   // center: .center,
                    center: .topLeading,
                    startRadius: 5, endRadius: 200)
            )
            .frame(width: 300, height: 400)
    }
}

struct Gradients_Bootcamp5_Previews: PreviewProvider {
    static var previews: some View {
        Gradients_Bootcamp5()
    }
}
