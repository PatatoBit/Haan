import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.modelContext) var modelContext
    @Query var events: [PaymentEvent]
    
    private func resetHistory() {
        do {
            try modelContext.delete(model: PaymentEvent.self)
        } catch {
            print("Failed to delete students.")
        }
    }
    
    var body: some View {
        VStack {
            Text("History")
                .font(.system(size: 30, weight: .bold, design: .serif))
            
            HStack {
                Text("Time")
                    .padding(.leading, 40)
                Spacer()
                Text("Balance")
                    .padding(.trailing, 43)
            } // HStack
            
            
            List(events) { event in
                HStack {
                    Text("\(event.createdAt, formatter: dateFormatter)")
                    Spacer()
                    Text("\(event.amount)")
                }
            }
            
            Button("Reset History") {
                resetHistory()
            }
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

#Preview {
    HistoryView()
}

