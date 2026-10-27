//
//  ContentView.swift
//  BiomolecularDesignProject
//
//  Created by Owen Andrew McFadden on 9/22/26.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace

    var body: some View {
        VStack {
            //ToggleImmersiveSpaceButton()
            
            Text("Five Shapes")
                .font(.largeTitle)
            
            Button("Show Shapes") {
                Task {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                }
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
