//
//  CompassWheel.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import SwiftUI

struct CompassWheel: View {
    let heading: Double
    
    let notchLength: CGFloat = 20
    let step: Int = 2
    let labels: [(Double, String)] = [
        (0, "С"),
        (90, "В"),
        (180, "Ю"),
        (270, "З")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = min(geometry.size.width, geometry.size.height) / 2
            
            ZStack {
                let needleStart = CGPoint(
                    x: center.x,
                    y: center.y - (radius + 40)
                )
                
                let needleEnd = CGPoint(
                    x: center.x,
                    y: center.y - radius + notchLength
                )
                
                Path { path in
                    path.move(to: needleStart)
                    path.addLine(to: needleEnd)
                }
                .stroke(Color("CustomBlack"), lineWidth: 5)
                
                ZStack {
                    ForEach(0..<360 / step, id: \.self) { index in
                        let angle = Double(index * step)
                        let radianAngle = CGFloat(angle - 90) * .pi / 180
                        
                        let notchStart = CGPoint(
                            x: center.x + radius * cos(radianAngle),
                            y: center.y + radius * sin(radianAngle)
                        )
                        let notchEnd = CGPoint(
                            x: center.x + (radius - notchLength) * cos(radianAngle),
                            y: center.y + (radius - notchLength) * sin(radianAngle)
                        )
                        
                        let isNotchOverNeedle = abs(angle - heading) < 1
                        
                        Path { path in
                            path.move(to: notchStart)
                            path.addLine(to: notchEnd)
                        }
                        .stroke(isNotchOverNeedle ? Color("CustomWhite") : Color("CustomBlack"), lineWidth: angle.truncatingRemainder(dividingBy: 30) == 0 ? 2.5 : 1)
                        
                        if angle.truncatingRemainder(dividingBy: 30) == 0 {
                            Text("\(Int(angle))")
                                .fixedSize()
                                .font(.subheadline)
                                .rotationEffect(.degrees(heading), anchor: .center)
                                .position(
                                    x: center.x + (radius + 25) * cos(radianAngle),
                                    y: center.y + (radius + 25) * sin(radianAngle)
                                )
                            
                        }
                        
                        if angle == 90 {
                            Triangle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                                .position(
                                    x: center.x,
                                    y: center.y - (radius + 10)
                                )
                        }
                    }
                    
                    ForEach(labels, id: \.0) { labelAngle, labelText in
                        let radianAngle = CGFloat(labelAngle - 90) * .pi / 180
                        Text(labelText)
                            .font(.title)
                            .rotationEffect(.degrees(heading), anchor: .center)
                            .position(
                                x: center.x + (radius - 50) * cos(radianAngle),
                                y: center.y + (radius - 50) * sin(radianAngle)
                            )
                    }
                }
                .rotationEffect(.degrees(-heading))
            }
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}


#Preview {
    CompassWheel(heading: 21)
}
