//
//  TextBootcamp2.swift
//  BootCamp
//
//  Created by Bob Bulliard on 11/29/21.
//

import SwiftUI

struct TextBootcamp2: View {
    var body: some View {
        Text("Hello, World! I am excited to be here.  what do you think?".lowercased())
            .font(.body)
         //   .fontWeight(.semibold)
         //   .bold()
        //    .underline()
        //    .underline(true, color: Color.red)
        //    .italic()
          //  .baselineOffset(33)
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            .frame(width: 400, height: 100, alignment: .leading )
        
    }
}

struct TextBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp2()
    }
}
