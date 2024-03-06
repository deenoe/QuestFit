import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var check: Bool
        
    init() {
        // Retrieve the value for key "firstTime" from UserDefaults
        let defaults = UserDefaults.standard
        
        if let value = defaults.object(forKey: "firstTime") as? Bool {
            // If the value exists, set it to check
            _check = State(initialValue: value)
        } else {
            // If the value doesn't exist, provide a default value
            _check = State(initialValue: true)
        }
    }
    var body: some View {
        Group {
            if check {
                OnboardingView()
            } else if viewModel.userSession != nil {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
