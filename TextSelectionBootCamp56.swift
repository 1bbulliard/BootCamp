//
//  TextSelectionBootCamp.swift
//  BootCamp
//
//  Created by Bob Bulliard on 12/7/21.
//
//
//  the text selection boot camp (.textSelection)
//    allows user to long press "hello, world" and 'share' it
//    or copy it.. pretty simple and cool
//
//
import SwiftUI

struct TextSelectionBootCamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .textSelection(.enabled)
    }
}

struct TextSelectionBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionBootCamp()
    }
}
