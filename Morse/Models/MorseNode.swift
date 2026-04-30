//
//  MorseNode.swift
//  Morse
//
//  Created by Adrián Nieto on 20/04/26.
//

import Foundation
import CoreGraphics

enum NodeOrientation {
    case horizontal
    case vertical
}

struct MorseNode {
    let letter: String
    let position: CGPoint
    let orientation: NodeOrientation
}

struct MorseData {
    static let tree: [String: MorseNode] = [
        // RAÍZ
        "": MorseNode(letter: "", position: CGPoint(x: 0.50, y: 0.18), orientation: .horizontal),
        
        // --- FILA 1  ---
        "-":    MorseNode(letter: "T", position: CGPoint(x: 0.42, y: 0.18), orientation: .horizontal),
        "--":   MorseNode(letter: "M", position: CGPoint(x: 0.27, y: 0.18), orientation: .horizontal),
        "---":  MorseNode(letter: "O", position: CGPoint(x: 0.12, y: 0.18), orientation: .horizontal),
        
        ".":    MorseNode(letter: "E", position: CGPoint(x: 0.58, y: 0.18), orientation: .horizontal),
        "..":   MorseNode(letter: "I", position: CGPoint(x: 0.73, y: 0.18), orientation: .horizontal),
        "...":  MorseNode(letter: "S", position: CGPoint(x: 0.86, y: 0.18), orientation: .horizontal),
        "....": MorseNode(letter: "H", position: CGPoint(x: 0.96, y: 0.18), orientation: .horizontal),
        
        // --- FILA 2 ---
        "--.":  MorseNode(letter: "G", position: CGPoint(x: 0.27, y: 0.32), orientation: .horizontal),
        "--.-": MorseNode(letter: "Q", position: CGPoint(x: 0.12, y: 0.32), orientation: .horizontal),
        
        "..-":  MorseNode(letter: "U", position: CGPoint(x: 0.73, y: 0.32), orientation: .vertical),
        "...-": MorseNode(letter: "V", position: CGPoint(x: 0.86, y: 0.32), orientation: .vertical),
        
        // --- FILA 3  ---
        "--..": MorseNode(letter: "Z", position: CGPoint(x: 0.27, y: 0.45), orientation: .horizontal),
        "..-.": MorseNode(letter: "F", position: CGPoint(x: 0.73, y: 0.45), orientation: .horizontal),
        
        // --- FILA 4  ---
        "-.":   MorseNode(letter: "N", position: CGPoint(x: 0.42, y: 0.58), orientation: .horizontal),
        "-.-":  MorseNode(letter: "K", position: CGPoint(x: 0.27, y: 0.58), orientation: .horizontal),
        "-.--": MorseNode(letter: "Y", position: CGPoint(x: 0.12, y: 0.58), orientation: .horizontal),
        
        ".-":   MorseNode(letter: "A", position: CGPoint(x: 0.58, y: 0.58), orientation: .vertical),
        ".-.":  MorseNode(letter: "R", position: CGPoint(x: 0.73, y: 0.58), orientation: .horizontal),
        ".-..": MorseNode(letter: "L", position: CGPoint(x: 0.86, y: 0.58), orientation: .horizontal),
        
        // --- FILA 5  ---
        "-.-.": MorseNode(letter: "C", position: CGPoint(x: 0.27, y: 0.71), orientation: .horizontal),
        
        // --- FILA 6 ---
        "-..":  MorseNode(letter: "D", position: CGPoint(x: 0.42, y: 0.84), orientation: .horizontal),
        "-..-": MorseNode(letter: "X", position: CGPoint(x: 0.27, y: 0.84), orientation: .horizontal),
        
        ".--":  MorseNode(letter: "W", position: CGPoint(x: 0.58, y: 0.84), orientation: .vertical),
        ".--.": MorseNode(letter: "P", position: CGPoint(x: 0.73, y: 0.84), orientation: .horizontal),
        
        // --- FILA 7 ---
        "-...": MorseNode(letter: "B", position: CGPoint(x: 0.42, y: 0.96), orientation: .horizontal),
        ".---": MorseNode(letter: "J", position: CGPoint(x: 0.58, y: 0.96), orientation: .vertical)
    ]
}
