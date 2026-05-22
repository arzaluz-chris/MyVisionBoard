//
//  ContentView.swift
//  MyVisionBoard
//
//  Created by Christian Arzaluz on 22/05/26.
//

import SwiftUI

struct ContentView: View {
    // MARK: - State

    @State private var boardTitle: String = "Mis Metas 2025"
    @State private var backgroundColor: Color = Color(uiColor: .systemGroupedBackground)
    @State private var selectedCategory: GoalCategory? = nil
    @State private var goals: [VisionGoal] = VisionGoal.sampleGoals
    @State private var showTitleAlert: Bool = false
    @State private var selectedGoal: VisionGoal? = nil
    @State private var cardsAppeared: Bool = false

    // MARK: - Computed

    private var filteredGoals: [VisionGoal] {
        guard let category = selectedCategory else { return goals }
        return goals.filter { $0.category == category }
    }

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    headerSection
                    gridSection
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .background(backgroundColor.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        ColorPicker("Selecciona un color", selection: $backgroundColor, supportsOpacity: false)
                            .labelsHidden()
                            .accessibilityLabel("Elegir color de fondo")
                        
                        Menu {
                            Button {
                                withAnimation(.spring(response: 0.4)) {
                                    selectedCategory = nil
                                }
                            } label: {
                                Label("Todas", systemImage: selectedCategory == nil ? "checkmark" : "square.grid.2x2")
                            }

                            ForEach(GoalCategory.allCases) { category in
                                Button {
                                    withAnimation(.spring(response: 0.4)) {
                                        selectedCategory = category
                                    }
                                } label: {
                                    Label(category.rawValue, systemImage: selectedCategory == category ? "checkmark" : category.icon)
                                }
                            }
                        } label: {
                            Image(systemName: selectedCategory?.icon ?? "line.3.horizontal.decrease.circle")
                                .font(.title3)
                                .foregroundStyle(.primary)
                        }
                        .accessibilityLabel("Filtrar por categoría")
                    }
                }
            }
            .alert("Título Actualizado", isPresented: $showTitleAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Tu vision board ahora se llama \"\(boardTitle)\"")
            }
            .sheet(item: $selectedGoal) { goal in
                if let index = goals.firstIndex(where: { $0.id == goal.id }) {
                    GoalDetailView(goal: $goals[index])
                }
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.5).delay(0.1)) {
                    cardsAppeared = true
                }
            }
        }
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField("Título del Vision Board", text: $boardTitle)
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundStyle(.primary)
                .autocorrectionDisabled()
                .onSubmit {
                    showTitleAlert = true
                }
                .accessibilityLabel("Editar título del vision board")
            
            Text("Visualiza tus sueños, alcanza tus metas")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 16)
    }

    // MARK: - Grid Section

    private var gridSection: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(Array(filteredGoals.enumerated()), id: \.element.id) { index, goal in
                GoalCardView(goal: goal)
                    .opacity(cardsAppeared ? 1 : 0)
                    .offset(y: cardsAppeared ? 0 : 20)
                    .animation(
                        .spring(response: 0.5, dampingFraction: 0.75)
                            .delay(Double(index) * 0.05),
                        value: cardsAppeared
                    )
                    .onTapGesture {
                        selectedGoal = goal
                    }
                    .accessibilityLabel("Meta: \(goal.title)")
                    .accessibilityHint("Categoría: \(goal.category.rawValue). Toca para ver detalles y progreso.")
            }
        }
    }
}

// MARK: - Goal Card View

struct GoalCardView: View {
    let goal: VisionGoal
    @State private var isPressed = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Background image
            Image(goal.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 140)
                .clipped()

            // Content below image
            VStack(alignment: .leading, spacing: 8) {
                // Category badge
                HStack(spacing: 4) {
                    Image(systemName: goal.category.icon)
                        .font(.system(size: 10))
                    Text(goal.category.rawValue)
                        .font(.system(size: 10, weight: .semibold))
                }
                .foregroundStyle(goal.category.color)
                
                // Title
                Text(goal.title)
                    .font(.subheadline.bold())
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .frame(minHeight: 36, alignment: .topLeading)

                // Progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color(uiColor: .quaternarySystemFill))
                            .frame(height: 4)

                        Capsule()
                            .fill(goal.category.color)
                            .frame(width: geo.size.width * goal.progress, height: 4)
                    }
                }
                .frame(height: 4)
            }
            .padding(12)
            .background(colorScheme == .dark ? Color(uiColor: .secondarySystemGroupedBackground) : .white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.black.opacity(0.08), radius: 8, y: 4)
        .scaleEffect(isPressed ? 0.96 : 1.0)
        .animation(.spring(response: 0.3), value: isPressed)
        .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: { })
    }
}

#Preview {
    ContentView()
}
