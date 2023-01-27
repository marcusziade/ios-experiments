import SwiftUI

struct TestView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct TestView2: View {

    var onSiikaPressed: (() -> Void)?
    var body: some View {
        Button {
            onSiikaPressed?()
        } label: {
            Text("Siika")
        }
    }
}

struct TestView3: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
            Text("xD xD xD")
                .font(.largeTitle)
        }
    }
}


