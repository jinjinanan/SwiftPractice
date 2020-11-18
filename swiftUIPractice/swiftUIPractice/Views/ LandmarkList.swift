//
//   LandmarkList.swift
//  swiftUIPractice
//
//  Created by admin on 2020/10/27.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List.init{
                ForEach(landmarkData){landmark in
                    if showFavoritesOnly || landmark.isFavorite{
                        NavigationLink(destination:LandmarkDetail(landmark: landmark)){
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct _LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList().previewDevice("iPhone SE")
        ForEach(["iPhone SE","iPhone XS Max"],id:\.self){ deviceName in
            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
        }
    }
}
