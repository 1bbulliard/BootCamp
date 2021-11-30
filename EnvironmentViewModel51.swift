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
//  i think environment object is "app" wide whereas state and observ objects
//     must be passed from view to view (thats biggest diff)


class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    init() {
      getData()
    }

        func getData() {
          //  self.dataArray.append("iphone")
          //  self.dataArray.append("ipad")
            self.dataArray.append(contentsOf: ["Iphone", "Ipad", "Imac", "Apple Watch"])
        }
    }


struct EnvironmentViewModel51: View {

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
