import SwiftUI

struct Coba: View {
    @State var items = Array(1...100) // Convert range to an array
    @State private var currentIndex = 0

    var body: some View {
        VStack {
            HStack {
                Button("Scroll to previous") {
                    scroll(to: currentIndex - 1)
                }

                Button("Scroll to next") {
                    scroll(to: currentIndex + 1)
                }
            }

            ScrollViewReader { scrollViewProxy in
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(items, id: \.self) { item in
                            Text(String(item))
                                .frame(width: 50, height: 50)
                                .id(item)
                        }
                    }
                    .onChange(of: currentIndex) { newValue in
                        withAnimation {
                            scrollViewProxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                    .onAppear {
                        scrollViewProxy.scrollTo(currentIndex, anchor: .top)
                    }
                }
                .frame(height: 300)
            }
        }
    }

    private func scroll(to index: Int) {
        currentIndex = index.clamped(to: 0..<items.count) // Adjust clamping range
    }
}

extension Comparable {
    func clamped(to range: Range<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Coba()
    }
}
