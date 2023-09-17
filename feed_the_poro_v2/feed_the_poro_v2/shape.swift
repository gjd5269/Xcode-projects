//
//  shape.swift
//  feed_the_poro_v2
//
//  Created by 刁 on 9/12/23.
//

import Foundation
import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()

        return path
    }
}
struct Pentagon: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let angle: CGFloat = .pi * 2 / 5
        var path = Path()

        for i in 0..<5 {
            let x = center.x + rect.width / 2 * cos(angle * CGFloat(i) - .pi / 2)
            let y = center.y + rect.height / 2 * sin(angle * CGFloat(i) - .pi / 2)
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()

        return path
    }
}
struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        var path = Path()
        for i in 0..<6 {
            let angle = CGFloat(Double.pi * 2 * Double(i) / 6.0)
            let point = CGPoint(x: center.x + rect.width / 2 * cos(angle), y: center.y + rect.height / 2 * sin(angle))
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}
