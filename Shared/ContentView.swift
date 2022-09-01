//
//  ContentView.swift
//  Shared
//
//  Created by Mentol on 30/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    var velocity: String {
        return locationManager.velocity
    }
    
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            HStack {
                Text(velocity)
                    .font(.system(size: 74))
                Text("km/h")
                    .font(.system(size: 44))
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
