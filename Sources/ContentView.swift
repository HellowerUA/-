import SwiftUI

struct Device: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let symbol: String
    let tint: Color
}

struct ContentView: View {
    let devices: [Device] = [
        Device(name: "iPhone", subtitle: "Смартфон", symbol: "iphone", tint: .blue),
        Device(name: "iPad", subtitle: "Планшет", symbol: "ipad", tint: .purple),
        Device(name: "MacBook", subtitle: "Ноутбук", symbol: "laptopcomputer", tint: .gray),
        Device(name: "iMac", subtitle: "Моноблок", symbol: "desktopcomputer", tint: .orange),
        Device(name: "Apple Watch", subtitle: "Умные часы", symbol: "applewatch", tint: .red),
        Device(name: "AirPods", subtitle: "Наушники", symbol: "airpods", tint: .mint),
        Device(name: "Vision Pro", subtitle: "Гарнитура", symbol: "visionpro", tint: .indigo),
        Device(name: "Apple TV", subtitle: "Медиаприставка", symbol: "appletv", tint: .teal),
        Device(name: "HomePod", subtitle: "Умная колонка", symbol: "homepod", tint: .pink),
        Device(name: "AirTag", subtitle: "Трекер", symbol: "airtag", tint: .yellow)
    ]

    let columns = [GridItem(.adaptive(minimum: 160), spacing: 16)]

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.blue, .purple, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    GlassEffectContainer(spacing: 16) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(devices) { device in
                                DeviceTile(device: device)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Устройства Apple")
        }
    }
}

struct DeviceTile: View {
    let device: Device

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: device.symbol)
                .font(.system(size: 52))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(device.tint)
                .frame(height: 64)

            Text(device.name)
                .font(.headline)

            Text(device.subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 170)
        .padding()
        .glassEffect(.regular, in: .rect(cornerRadius: 28))
    }
}

#Preview {
    ContentView()
}
