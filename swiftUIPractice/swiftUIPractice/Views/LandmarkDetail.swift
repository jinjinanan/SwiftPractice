//
//  ContentView.swift
//  swiftUIPractice
//
//  Created by admin on 2020/10/26.
//

import SwiftUI


struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate:landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height:300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom,-130)
            VStack(alignment:.leading){
                Text(landmark.name).font(.title).bold()
                HStack {
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)

//        VStack{
//            Text("Unpadded text")
//               .border(Color.yellow)
//
//            Text("padding(.all)")
//               .padding(.all)
//               .border(Color.gray)
//
//            Text("padding(.horizontal)")
//               .padding(.horizontal)
//               .border(Color.gray)
//
//            Text("padding(.vertical)")
//               .padding(.vertical)
//               .border(Color.gray)
//
//            Text("padding(.bottom)")
//               .padding(.bottom)
//               .border(Color.gray)
//
//            Text("padding(.top, 10)")
//               .padding(.top, 10)
//               .border(Color.gray)
//
//            Text("padding(10)")
//               .padding(10)
//               .border(Color.gray)
//
//            Text("padding([.top, .bottom])")
//               .padding([.top, .bottom])
//               .border(Color.gray)
//
//            Text("padding([.leading, .trailing], 10)")
//               .padding([.leading, .trailing], 10)
//               .border(Color.gray)
//
//            Text("padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))")
//               .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
//               .border(Color.gray)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkDetail(landmark:landmarkData[0])
        }
    }
}
