//
//  VisionGoal.swift
//  MyVisionBoard
//
//  Created by Christian Arzaluz on 22/05/26.
//

import SwiftUI

// MARK: - Goal Category

enum GoalCategory: String, CaseIterable, Identifiable {
    case salud = "Salud"
    case carrera = "Carrera"
    case crecimientoPersonal = "Crecimiento Personal"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .salud: return "heart.fill"
        case .carrera: return "briefcase.fill"
        case .crecimientoPersonal: return "sparkles"
        }
    }

    var color: Color {
        switch self {
        case .salud: return Color(hue: 0.95, saturation: 0.6, brightness: 0.95)
        case .carrera: return Color(hue: 0.6, saturation: 0.6, brightness: 0.95)
        case .crecimientoPersonal: return Color(hue: 0.75, saturation: 0.5, brightness: 0.95)
        }
    }
}

// MARK: - Vision Goal

struct VisionGoal: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let quote: String
    let category: GoalCategory
    var progress: Double
    var feeling: String
}

// MARK: - Sample Data

extension VisionGoal {
    static let sampleGoals: [VisionGoal] = [
        VisionGoal(
            imageName: "dream_car",
            title: "Mi Auto Soñado",
            quote: "El camino al éxito se recorre con determinación.",
            category: .crecimientoPersonal,
            progress: 0.1,
            feeling: "🚀"
        ),
        VisionGoal(
            imageName: "dream_house",
            title: "Mi Hogar Ideal",
            quote: "Un hogar es donde el corazón encuentra paz.",
            category: .crecimientoPersonal,
            progress: 0.05,
            feeling: "🏡"
        ),
        VisionGoal(
            imageName: "dream_job",
            title: "Trabajo de Mis Sueños",
            quote: "Haz lo que amas y nunca trabajarás un día.",
            category: .carrera,
            progress: 0.3,
            feeling: "💼"
        ),
        VisionGoal(
            imageName: "familia",
            title: "Tiempo con Mi Familia",
            quote: "La familia es el tesoro más grande de la vida.",
            category: .crecimientoPersonal,
            progress: 0.7,
            feeling: "❤️"
        ),
        VisionGoal(
            imageName: "golden_retriever",
            title: "Tener un Golden Retriever",
            quote: "Un perro llena tu vida de alegría incondicional.",
            category: .crecimientoPersonal,
            progress: 0.2,
            feeling: "🐕"
        ),
        VisionGoal(
            imageName: "piano",
            title: "Aprender a Tocar Piano",
            quote: "La música es el lenguaje del alma.",
            category: .crecimientoPersonal,
            progress: 0.15,
            feeling: "🎵"
        ),
        VisionGoal(
            imageName: "swift_student_challenge",
            title: "Ganar Swift Student Challenge",
            quote: "Cada línea de código te acerca a tu meta.",
            category: .carrera,
            progress: 0.4,
            feeling: "🏆"
        ),
        VisionGoal(
            imageName: "test_japanese",
            title: "Aprobar Examen de Japonés",
            quote: "Aprender un idioma abre puertas al mundo.",
            category: .carrera,
            progress: 0.25,
            feeling: "📚"
        ),
        VisionGoal(
            imageName: "travel_to_japan",
            title: "Viajar a Japón",
            quote: "Viajar es la única cosa que compras que te hace más rico.",
            category: .crecimientoPersonal,
            progress: 0.1,
            feeling: "✈️"
        ),
    ]
}
