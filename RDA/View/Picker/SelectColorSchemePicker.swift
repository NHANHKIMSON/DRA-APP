import SwiftUI
struct ColorSchemePicker: View {
    @AppStorage("appearance") private var selectedAppearance: Appearance = .system
        
        var colorScheme: ColorScheme? {
            switch selectedAppearance {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return nil
            }
        }
    var body: some View {
        Picker("Appearance", selection: $selectedAppearance) {
            ForEach(Appearance.allCases) { mode in
                Text(mode.rawValue).tag(mode)
            }
        }
        .pickerStyle(.menu)
    }
}
