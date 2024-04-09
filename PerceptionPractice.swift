import SwiftUI
import Perception

struct PerceptionPractice: View {
    
    @Perception.Bindable fileprivate var viewModel = ViewModel()
    
    var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 32) {
                TextField(text: $viewModel.text) {
                    Text("Type Something")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                
                Text("\(viewModel.count)")
                    .font(.title)
                Button("increase") {
                    viewModel.count += 1
                }
                Button("decrease") {
                    viewModel.count -= 1
                }
            }
        }
    }
}

@Perceptible
fileprivate class ViewModel {
    var text = ""
    var count = 0
}

#Preview {
    PerceptionPractice()
}
