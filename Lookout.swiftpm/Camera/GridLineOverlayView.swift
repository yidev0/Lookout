import SwiftUI
import Vision

struct GridLineOverlayView: View {

    var numberOfRows: Int
    var columns: [GridItem]
    
    init(numberOfRows: Int) {
        self.numberOfRows = numberOfRows
        self.columns = [GridItem](repeating: GridItem(spacing: 0), count: numberOfRows)
    }
    
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: columns, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                ForEach(0..<numberOfRows*numberOfRows, id: \.self) { index in
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: geometry.size.height/3, alignment: .center)
                        .overlay(alignment: .center) { 
                            Rectangle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.secondary)
                        }
                }
            }
        }
        .padding(.all, 1)
    }
}

struct GridLineOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GridLineOverlayView(numberOfRows: 2)
            GridLineOverlayView(numberOfRows: 3)
        }
    }
}
