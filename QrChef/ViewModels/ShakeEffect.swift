//
//  ShakeEffect.swift
//  QrChef
//
//  Created by apprenant1 on 04/12/2022.
//

import Foundation
import SwiftUI

struct ShakeEffect: GeometryEffect {
    var travelDistance : CGFloat = 6
    var numOfShakes : CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue (size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX: travelDistance * sin(animatableData * .pi * numOfShakes), y: 9))
    }
}
