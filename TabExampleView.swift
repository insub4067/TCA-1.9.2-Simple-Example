import SwiftUI
import ComposableArchitecture

struct TabExampleView: View {
    
    let store: StoreOf<TabFeature>
    
    init(state: TabFeature.State = .init()) {
        self.store = .init(initialState: state, reducer: {
            TabFeature()
        })
    }
    
    var body: some View {
        WithPerceptionTracking {
            TabView {
                CounterView(
                    store: store.scope(
                        state: \.counterA,
                        action: \.counterA))
                .tabItem {
                    Text("Counter A")
                }
                
                CounterView(
                    store: store.scope(
                        state: \.counterB,
                        action: \.counterB))
                .tabItem {
                    Text("Counter B")
                }
                
                CounterView(
                    store: store.scope(
                        state: \.counterC,
                        action: \.counterC))
                .tabItem {
                    Text("Counter C")
                }
            }
        }
    }
}

@Reducer
struct TabFeature {
    
    @ObservableState
    struct State {
        var counterA = CounterFeature.State()
        var counterB = CounterFeature.State()
        var counterC = CounterFeature.State()
    }
    
    enum Action {
        case counterA(CounterFeature.Action)
        case counterB(CounterFeature.Action)
        case counterC(CounterFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.counterA, action: \.counterA) {
            CounterFeature()
        }
        Scope(state: \.counterB, action: \.counterB) {
            CounterFeature()
        }
        Scope(state: \.counterC, action: \.counterC) {
            CounterFeature()
        }
        Reduce { state, action in
            return .none
        }
    }
}
