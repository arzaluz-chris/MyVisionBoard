//
//  GoalDetailView.swift
//  MyVisionBoard
//
//  Created by Christian Arzaluz on 22/05/26.
//

import SwiftUI

struct GoalDetailView: View {
    @Binding var goal: VisionGoal
    @Environment(\.dismiss) private var dismiss
    @State private var animateProgress = false

    private let feelings = ["🚀", "❤️", "🔥", "💪", "😊", "🎯", "⭐️", "🌟", "💡", "🙏"]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {

                // MARK: - Hero Image
                ZStack(alignment: .topTrailing) {
                    ZStack(alignment: .bottomLeading) {
                        Image(goal.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 320)
                            .clipped()

                        // Gradient overlay
                        LinearGradient(
                            colors: [.clear, .clear, .black.opacity(0.8)],
                            startPoint: .top,
                            endPoint: .bottom
                        )

                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Image(systemName: goal.category.icon)
                                    .font(.caption)
                                Text(goal.category.rawValue)
                                    .font(.caption.weight(.semibold))
                            }
                            .foregroundStyle(.white.opacity(0.85))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(.ultraThinMaterial, in: Capsule())

                            Text(goal.title)
                                .font(.title.bold())
                                .foregroundStyle(.white)
                        }
                        .padding(24)
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                    .padding(16)
                }
                .frame(height: 320)

                    VStack(spacing: 28) {

                        // MARK: - Quote
                        HStack(spacing: 12) {
                            Rectangle()
                                .fill(goal.category.color)
                                .frame(width: 3)
                                .cornerRadius(2)

                            Text("\u{201C}\(goal.quote)\u{201D}")
                                .font(.body)
                                .italic()
                                .foregroundStyle(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.horizontal, 4)

                        // MARK: - Progress Section
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Label("Progreso", systemImage: "chart.bar.fill")
                                    .font(.headline)
                                Spacer()
                                Text("\(Int(goal.progress * 100))%")
                                    .font(.title3.bold().monospacedDigit())
                                    .foregroundStyle(goal.category.color)
                            }

                            // Animated progress bar
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(Color(.systemGray5))
                                        .frame(height: 10)

                                    Capsule()
                                        .fill(
                                            LinearGradient(
                                                colors: [goal.category.color, goal.category.color.opacity(0.7)],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(
                                            width: animateProgress ? geo.size.width * goal.progress : 0,
                                            height: 10
                                        )
                                }
                            }
                            .frame(height: 10)

                            Slider(value: $goal.progress, in: 0...1, step: 0.05)
                                .tint(goal.category.color)
                                .accessibilityLabel("Progreso de la meta")
                                .accessibilityValue("\(Int(goal.progress * 100)) por ciento")
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemBackground))
                                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
                        )

                        // MARK: - Feeling Section
                        VStack(alignment: .leading, spacing: 16) {
                            Label("¿Cómo te sientes con esta meta?", systemImage: "face.smiling")
                                .font(.headline)

                            LazyVGrid(
                                columns: Array(repeating: GridItem(.flexible()), count: 5),
                                spacing: 12
                            ) {
                                ForEach(feelings, id: \.self) { emoji in
                                    Text(emoji)
                                        .font(.title)
                                        .frame(width: 52, height: 52)
                                        .background(
                                            Circle()
                                                .fill(goal.feeling == emoji
                                                    ? goal.category.color.opacity(0.2)
                                                    : Color(.systemGray6))
                                        )
                                        .overlay(
                                            Circle()
                                                .strokeBorder(
                                                    goal.feeling == emoji
                                                        ? goal.category.color
                                                        : .clear,
                                                    lineWidth: 2.5
                                                )
                                        )
                                        .scaleEffect(goal.feeling == emoji ? 1.15 : 1.0)
                                        .animation(.spring(response: 0.3), value: goal.feeling)
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.3)) {
                                                goal.feeling = emoji
                                            }
                                        }
                                        .accessibilityLabel("Sentimiento: \(emoji)")
                                }
                            }
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color(uiColor: .secondarySystemGroupedBackground))
                                .shadow(color: .black.opacity(0.04), radius: 12, y: 4)
                        )
                    }
                    .padding(20)
                }
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .ignoresSafeArea(edges: .top)
            .onAppear {
                withAnimation(.easeOut(duration: 0.8).delay(0.2)) {
                    animateProgress = true
                }
            }
    }
}

#Preview {
    GoalDetailView(goal: .constant(VisionGoal.sampleGoals[0]))
}
