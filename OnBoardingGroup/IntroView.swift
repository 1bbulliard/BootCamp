//
//  IntroView.swift
//  BootCamp
//
//  Created by Bob Bulliard on 12/8/21.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack{
         RadialGradient(
            gradient: Gradient(colors: [Color(.blue), Color(.green)]),
            center:.center,
            startRadius: 5,
          //  endRadius: 500)
            endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            if currentUserSignedIn {
                Text ("Profile View")
            }
                    else {
                        Text("onboardingview")
                    }
                }
            }
        }
    


struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
