//
//  TreeMapView.swift
//  Morse
//
//  Created by Adrián Nieto on 20/04/26.
//

import SwiftUI

struct TreeMapView: View {
    let currentSequence: String
    let isPressing: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let baseWidth = geometry.size.width
            let dotSize = baseWidth * 0.045
            let dashLong = baseWidth * 0.10
            let dashShort = baseWidth * 0.035
            let fontSize = baseWidth * 0.038
            
            Canvas { context, size in
                let w = size.width
                let h = size.height
                
                for (seq, node) in MorseData.tree {
                    if seq.isEmpty { continue }
                    let parentSeq = String(seq.dropLast())
                    if let parent = MorseData.tree[parentSeq] {
                        let start = CGPoint(x: parent.position.x * w, y: parent.position.y * h)
                        let end = CGPoint(x: node.position.x * w, y: node.position.y * h)
                        
                        var path = Path()
                        path.move(to: start)
                        path.addLine(to: end)
                        
                        let isActive = currentSequence.hasPrefix(seq)
                        context.stroke(path, with: .color(isActive ? .green : .gray.opacity(0.3)), lineWidth: baseWidth * 0.005)
                    }
                }
                
                for (seq, node) in MorseData.tree {
                    let point = CGPoint(x: node.position.x * w, y: node.position.y * h)
                    let isActive = (seq == currentSequence)
                    
                    if seq.isEmpty {
                        var antennaPath = Path()
                        let aWidth = baseWidth * 0.06
                        let aHeight = baseWidth * 0.08
                        
                        antennaPath.move(to: CGPoint(x: point.x, y: point.y))
                        antennaPath.addLine(to: CGPoint(x: point.x, y: point.y - aHeight))
                        
                        antennaPath.move(to: CGPoint(x: point.x, y: point.y - aHeight))
                        antennaPath.addLine(to: CGPoint(x: point.x - aWidth/2, y: point.y - aHeight - aWidth/2))
                        antennaPath.addLine(to: CGPoint(x: point.x + aWidth/2, y: point.y - aHeight - aWidth/2))
                        antennaPath.closeSubpath()
                        
                        context.stroke(antennaPath, with: .color(isActive ? .green : .white), lineWidth: baseWidth * 0.004)
                        continue
                    }
                    
                    let isDot = seq.last == "."
                    let nodePath: Path
                    
                    if isDot {
                        let rect = CGRect(x: point.x - dotSize/2, y: point.y - dotSize/2, width: dotSize, height: dotSize)
                        nodePath = Path(ellipseIn: rect)
                    } else {
                        let rw = node.orientation == .horizontal ? dashLong : dashShort
                        let rh = node.orientation == .horizontal ? dashShort : dashLong
                        let rect = CGRect(x: point.x - rw/2, y: point.y - rh/2, width: rw, height: rh)
                        nodePath = Path(rect)
                    }
                    
                    var color: Color = .black
                    if isActive {
                        color = isPressing ? (isDot ? .green : .red) : .white
                    }
                    
                    context.fill(nodePath, with: .color(color))
                    context.stroke(nodePath, with: .color(.white), lineWidth: baseWidth * 0.004)
                    
                    let text = Text(node.letter)
                        .font(.system(size: fontSize, weight: .regular, design: .monospaced))
                        .foregroundColor(.white)
                    
                    var dx: CGFloat = 0
                    var dy: CGFloat = 0
                    
                    switch node.letter {
                    case "O", "M", "T", "E", "I", "S", "H", "Y", "K", "N":
                        dx = -(fontSize * 1.2)
                        dy = -(fontSize * 1.5)
                    case "Q":
                        dx = -(fontSize * 1.2)
                        dy = (fontSize * 1.2)
                    case "X", "B", "U", "A", "W":
                        dx = -(fontSize * 1.8)
                        dy = 0
                    case "G", "Z", "C", "F", "V", "P", "J", "L":
                        dx = (fontSize * 1.5)
                        dy = 0
                    case "D":
                        dx = (fontSize * 1.2)
                        dy = -(fontSize * 1.2)
                    case "R":
                        dx = 0
                        dy = (fontSize * 1.5)
                    default:
                        dx = 0
                        dy = 0
                    }
                    
                    context.draw(text, at: CGPoint(x: point.x + dx, y: point.y + dy))
                }
            }
        }
    }
}
