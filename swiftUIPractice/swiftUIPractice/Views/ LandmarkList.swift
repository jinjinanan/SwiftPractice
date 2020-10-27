//
//   LandmarkList.swift
//  swiftUIPractice
//
//  Created by admin on 2020/10/27.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List.init(landmarkData){landmark in
                NavigationLink(destination:LandmarkDetail(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
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
