//
//  OnBoardingView.swift
//  BootCamp
//
//  Created by Bob Bulliard on 12/8/21.
//

import SwiftUI

struct OnboardingView: View {
    // onboarding states:
    // 0 - welcome
    // 1 - add name
    // 2 - add age
    // 3 - add gender
    @State var onboardingState: Int = 2
    @State var name: String = ""
    @State var age: Double = 50
    
    var body: some View {
        ZStack {
            ZStack {
                switch onboardingState {
                case 0:
                    welomeSection
                case 1:
                    addNameSection
                case 2:
                    addAgeSection
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                        
                }
            }
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.732, saturation: 0.254, brightness: 0.68)/*@END_MENU_TOKEN@*/)
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
    }
    
   
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
// mark:compontents
extension OnboardingView {
    private var bottomButton: some View {
           Text("Sign in")
                               .foregroundColor(.purple)
                               .font(.headline)
                               .frame(height:55)
                               .frame(width: .infinity)
                               .background(Color.green)
                               .cornerRadius(10)
                               .onTapGesture {
                                    
                               }
           }
    private var welomeSection: some View {
        VStack(spacing:40){
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
               .frame(width:200, height:200)
                .foregroundColor(Color(hue: 0.598, saturation: 0.644, brightness: 0.568, opacity: 0.92))
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                    
            Text("this is the number 1 match forfinding your match online. we are practicing swift")
                .fontWeight(.medium)
        Spacer()
            Spacer()
            
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    private var addNameSection: some View {
        VStack(spacing:40){
            Spacer()
          Text("Whats your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name: ", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            //   .foregroundColor(.white)
            Spacer()
            Spacer()
            
        }
        .padding(30)
    }
    private var addAgeSection: some View {
        VStack(spacing:40){
            Spacer()
          Text("Whats your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text("\(String(format: "%.0f", age))")
                .foregroundColor(.white)
                .fontWeight(.semibold)
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            
          //  Text("Age:\(age)")
            Spacer()
            Spacer()
            
        }
        .padding(30)
    }
}
