//
//  EnvironmentViewModel51.swift
//  BootCamp
//
//  Created by Bob Bulliard on 11/29/21.
//

import SwiftUI
//
//  there are 3 things to learn about objects
//  ObservedObject
//  StateObject and finally in this section
//  Environment object
//  all do similar things but differently
//  environment object is "app" wide whereas state and observ objects
//     must be passed from view to view (thats biggest diff)
// in all classes, the class is ObservableObject and published

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    init() {
      getData()
    }

        func getData() {
          //  self.dataArray.append("iphone")
          //  self.dataArray.append("ipad")
            self.dataArray.append(contentsOf: ["Iphone", "Ipad", "Imac", "Apple Watchx1"])
        }
    }


struct EnvironmentViewModel51: View {
// To use environment;
//   1). add the StateObject as i did with the Observable object
//   2).then add the.environmentObject below. step 1 and 2 are in the initial/primary view
// To each sub view, add:
//      @EnvironmentObject var viewModel: EnvironmentViewModel
//  TO not use environment object, remove environment object and add

//  Note 1: that @StateObject is used whether you use environment or not
//  Note 2: to use environment object, just add .environmentObject(viewModel)
//  Note 3: to not use environment object, dont add . environmentObject(viewModel)
    // do add @ObservedObject var viewModel = ContentViewModel()
    @StateObject var viewModel:EnvironmentViewModel = EnvironmentViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self){item in
                    NavigationLink (destination: DetailView(selectedItem: item),
                label: {
                        Text(item)
                    //Text(item)
                    })}
            }
            .navigationTitle("title")
    }
        .environmentObject(viewModel)
}
}

struct DetailView: View {
    
    //note: this view doesnt use the environment , but just passes one item
    // to this view so i dont have  @EnvironmentObject var viewModel: EnvironmentViewModel
    let selectedItem: String
    
    var body: some View {
        ZStack{
        
        Color.orange.ignoresSafeArea()
            //
            NavigationLink(
                destination: FinalView(),
                label: {
                    Text(selectedItem)
                        
                    .font(.headline)
                .foregroundColor((.orange))
                .padding()
                .padding()
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(30)
                }
            )
                }
            
            //
            
            
        }
    }


struct FinalView: View {
    //note: this view does use the environment
    // so i added:   @EnvironmentObject var viewModel: EnvironmentViewModel
    // to use observable object use observable object, remove environment object
    //     the problem with observable is you may have to pass params is an intermediate view does not use the observable object
    //  always use environment object to keep it simple
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.red, Color.blue],
                           startPoint: .leading,
                           endPoint: .trailing)
            .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20){
                    ForEach(viewModel.dataArray, id:\.self) {item in
                        Text(item)
                    }
                }
            }
            
        }
    }
}


struct EnvironmentViewModel51_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentViewModel51()
    }
}
