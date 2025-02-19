import SwiftUI

struct MainScreen: View {
    
    @State private var scrollOffsetY: CGFloat = .zero
    @State private var colors: [Color] = [
        .red,
        .green,
        .blue,
        .orange,
        .yellow,
        .brown,
        .teal,
        .purple,
        .cyan,
        .indigo,
        .pink
    ]
    
    var body: some View {
        GeometryReader { proxy in
            let safeArea = proxy.safeAreaInsets
            ScrollView {
                VStack(spacing: 0) {
                    Header(safeArea: safeArea)
                        .padding([.horizontal, .vertical])
                    ForEach(colors, id: \.self) { color in
                        ColorCell(color)
                    }
                }
                .padding(.vertical)
                .zIndex(0)
                .scrollTargetLayout()
            }
            .onScrollGeometryChange(for: CGFloat.self) { geometry in
                geometry.contentOffset.y + geometry.contentInsets.top
            } action: { _, newValue in
                scrollOffsetY = newValue
            }
            .background(Color(uiColor: .secondarySystemGroupedBackground))
        }
        
    }
    
    @ViewBuilder
    private func ColorCell(_ color: Color) -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .scrollView).minY
            Rectangle()
                .fill(color.gradient)
                .blur(radius: max(0, -minY * 0.05))
        }
        .frame(height: 150)
    }
    
    @ViewBuilder
    private func Header(safeArea: EdgeInsets) -> some View {
        VStack {
            Text("Hello, Leopold!")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(1.0 - max(0, scrollOffsetY * 0.02))
            
            SearchField()
        }
        .zIndex(1)
    }
    
    @ViewBuilder
    private func SearchField() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .scrollView).minY
            HStack {
                Image(systemName: "magnifyingglass")
                    .fontWeight(.semibold)
                Text("What do you want to search for?")
                    .font(.system(size: 15))
                Spacer()
            }
            .foregroundStyle(.secondary)
            .padding(.horizontal)
            .frame(height: proxy.size.height)
            .background(
                Color(uiColor: .tertiarySystemGroupedBackground),
                in: .capsule
            )
            .shadow(radius: 12)
            .offset(y: max(0, -minY))
        }
        .frame(height: 50)
    }
}

#Preview {
    MainScreen()
}
