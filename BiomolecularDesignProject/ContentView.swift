//
//  ContentView.swift
//  BiomolecularDesignProject
//
//  Created by Owen Andrew McFadden on 9/22/26.
//

import SwiftUI
import RealityKit

struct ContentView: View {

    var body: some View {
        VStack {
            ToggleImmersiveSpaceButton()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
