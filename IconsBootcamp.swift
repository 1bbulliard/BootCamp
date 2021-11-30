//
//  IconsBootcamp.swift
//  BootCamp
//
//  Created by Bob Bulliard on 11/29/21.
//
//  use SF application in program folder on mac to see all icons
//
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        VStack{
        Image(systemName: "heart.fill")
        
        // resizable expands to frame size...cool, huh?
            .resizable()
            .aspectRatio(contentMode: .fit)
        //  .font(.system(size: 500))
//.font(.system(size: 200))
            .foregroundColor(.blue)
            .frame(width: 300, height: 300)
            
            Image(systemName: "flame")
            // resizable expands to frame size...cool, huh?
                .resizable()
                .aspectRatio(contentMode: .fit)
            //  .font(.system(size: 500))
    //.font(.system(size: 200))
                .foregroundColor(.blue)
                .frame(width: 300, height: 300)
    }
}
}
struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
