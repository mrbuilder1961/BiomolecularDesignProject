//
//  ImmersiveView.swift
//  BiomolecularDesignProject
//
//  Created by Owen Andrew McFadden on 9/22/26.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let sphere1 = ModelEntity(
                mesh: .generateSphere(radius: 0.5),
                materials: [SimpleMaterial(color: .magenta, isMetallic: true)])
            sphere1.position = [-0.6, 1.2, -1]
            content.add(sphere1)
            let sphere2 = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .red, isMetallic: false)])
            sphere2.position = [-0.3, 1.2, -1]
            content.add(sphere2)
            let box1 = ModelEntity(
                mesh: .generateBox(size: 0.15),
                materials: [SimpleMaterial(color: .yellow, isMetallic: false)])
            box1.position = [0, 1.2, -1]
            content.add(box1)
            let box2 = ModelEntity(
                mesh: .generateBox(size: 0.15),
                materials: [SimpleMaterial(color: .systemGray, isMetallic: false)])
            box2.position = [0.3, 1.2, -1]
            content.add(box2)
            let sphere3 = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .purple, isMetallic: false)])
            sphere3.position = [0.6, 1.2, -1]
            content.add(sphere3)
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
        .environment(AppModel())
}
