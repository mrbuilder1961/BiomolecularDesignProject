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
                mesh: .generateSphere(radius: 0.02),
                materials: [SimpleMaterial(color: .systemGreen, isMetallic: true)]
            )
            sphere1.position = [-0.6, 1.2, -1]
            content.add(sphere1)
            moveObject(object: sphere1, sleepFor: 2, transform: [-0.6, -3, -1], duration: 20.0)
            moveObject(object: sphere1, sleepFor: 22, transform: [-0.6, 0, -1], duration: 20.0)
            
            let sphere2 = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .red, isMetallic: false)]
            )
            sphere2.position = [-0.3, 1.2, -1]
            content.add(sphere2)
            moveObject(object: sphere2, sleepFor: 2, transform: [-0.3, 0, -1], duration: 10.0)
            
            let box1 = ModelEntity(
                mesh: .generateBox(size: 0.15),
                materials: [SimpleMaterial(color: .yellow, isMetallic: false)]
            )
            box1.position = [0, 1.2, -1]
            content.add(box1)
            moveObject(object: box1, sleepFor: 2, transform: [0, 1.5, -2], duration: 5)
            
            let box2 = ModelEntity(
                mesh: .generateBox(size: 0.15),
                materials: [SimpleMaterial(color: .systemGray, isMetallic: false)]
            )
            box2.position = [0.3, 1.2, -1]
            content.add(box2)
            moveObject(object: box2, sleepFor: 2, transform: [1, 1.5, 2], duration: 7)
            
            let sphere3 = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .purple, isMetallic: true)]
            )
            sphere3.position = [0.6, 1.2, -1]
            sphere3.components.set(InputTargetComponent())
            sphere3.components.set(CollisionComponent(
                shapes: [.generateSphere(radius: 0.1)]
            ))
            content.add(sphere3)
            moveObject(object: sphere3, sleepFor: 2, transform: [0, 0, 0], duration: 5)
        }
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    value.entity.position = value.convert(
                        value.location3D, from: .local, to: value.entity.parent!)
                }
        )
        .gesture(
            RotateGesture3D()
                .targetedToAnyEntity()
                .onChanged { value in
                    //value.entity.transform.rotation = value.rotation
                }
        )
    }
}

func moveObject(object: HasTransform, sleepFor: Int32, transform: SIMD3<Float>, duration: TimeInterval) {
    Task {
        try? await Task.sleep(for: .seconds(sleepFor))
        object.move(
            to: Transform(translation: transform),
            relativeTo: nil,
            duration: duration
        )
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
        .environment(AppModel())
}

