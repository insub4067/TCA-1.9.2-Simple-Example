import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    let store: StoreOf<ContentReducer>
    
    init(state: ContentReducer.State) {
        self.store = .init(initialState: state, reducer: {
            ContentReducer()
        })
    }
    
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("\(store.count)")
                    .font(.title)
                Button("Increase") {
                    store.send(.increase)
                }
                Button("Decrease") {
                    store.send(.decrease)
                }
            }.padding()
        }
    }
}

@Reducer
struct ContentReducer {
    
    @ObservableState
    struct State {
        var count = 0
    }
    
    enum Action {
        case increase
        case decrease
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .increase:
                state.count += 1
                return .none
            case .decrease:
                state.count -= 1
                return .none
            }
        }._printChanges()
    }
}

#Preview {
    ContentView(state: .init())
}
