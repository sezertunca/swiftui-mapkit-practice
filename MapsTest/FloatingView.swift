import SwiftUI
import Combine

struct FloatingView<Content: View>: View {
    
    @ViewBuilder var content: Content
    
    private var geo: GeometryProxy
    private let height: CGFloat
    private var cornerRadius: CGFloat = 10
    private var handleAreaHeight: CGFloat = 80
    
    init(_ content: Content, geo: GeometryProxy) {
        self.content = content
        self.geo = geo
        self.height = geo.size.height
    }
    
    enum FloatingState {
        case expanded
        case collapsed
    }
    
    @State private var currentState = FloatingState.collapsed
    @State private var floatingViewOffset: CGFloat = 0
    
    private var nextFloatingState: FloatingState {
       currentState == .collapsed ? .expanded : .collapsed
    }
        
    private func updateOffset(geo: GeometryProxy) {
        switch currentState {
        case .collapsed:
            floatingViewOffset = height / 2
        case .expanded:
            floatingViewOffset = 0 + 80
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 0)
                    .fill(.black.opacity(0.5))
                    .frame(width: 30, height: 4)
                Spacer()
            }
            .frame(height: currentState == .expanded ? 0 : 30)
            .opacity(currentState == .expanded ? 0 : 1)
            content
        }
        .background(Color.white)
        .frame(width: geo.size.width, height: height)
        .offset(x: 0, y: floatingViewOffset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    withAnimation(.spring()) {
                        let dragHeight = gesture.translation.height

                        // Up
                        if dragHeight < 0 {
                            if currentState == .collapsed {
                                currentState = .expanded
                            }
                        }

                        // Down
                        if dragHeight > 0 {
                            if currentState == .expanded {
                                currentState = .collapsed
                            }
                        }

                        updateOffset(geo: geo)
                }
            }
        )
        .onAppear {
            updateOffset(geo: geo)
        }
    }
}

//struct FloatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FloatingView {
//            Text("Hello Content")
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
