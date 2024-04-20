import SwiftUI

struct EllipsisToHStackView: View {
    
    @State private var buttonStackScale: Double = .zero
    @State private var ellipsisScale: Double = 1
    @State private var ellipsisOpacity: Double = 1
    
    var body: some View {
        Group {
            ZStack {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .imageScale(.medium)
                    .opacity(ellipsisOpacity)
                    .scaleEffect(ellipsisScale)
                    .onTapGesture {
                        withAnimation(.bouncy(duration: 0.2, extraBounce: 0.2)) {
                            buttonStackScale = 1
                            ellipsisOpacity = .zero
                            ellipsisScale = 1.5
                        }
                    }
                
                HStack {
                    Image(systemName: "pencil")
                        .modifier(CircleButtonModifier())
                    Image(systemName: "xmark.bin")
                        .modifier(CircleButtonModifier(color: .red))
                    Image(systemName: "return")
                        .modifier(CircleButtonModifier())
                        .onTapGesture {
                            withAnimation(.bouncy(duration: 0.2)) {
                                buttonStackScale = .zero
                                
                            }
                            withAnimation(.bouncy(duration: 0.2, extraBounce: 0.3)) {
                                ellipsisOpacity = 1
                                ellipsisScale = 1
                            }
                        }
                }
                .scaleEffect(buttonStackScale)
            }
        }
    }
}

struct CircleButtonModifier: ViewModifier {
    let color: Color
    
    init(color: Color = .gray.opacity(0.3)) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(Circle())
            .imageScale(.large)
    }
}

#Preview {
    EllipsisToHStackView()
}
