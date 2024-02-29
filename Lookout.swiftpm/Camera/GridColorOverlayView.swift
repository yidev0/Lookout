import SwiftUI

struct GridColorOverlayView: View {

    var items: [GridDescription]
    var numberOfRows: Int
    var columns: [GridItem]
    
    init(numberOfRows: Int, items: [GridDescription]) {
        self.numberOfRows = numberOfRows
        self.columns = [GridItem](repeating: GridItem(spacing: 0), count: numberOfRows)
        self.items = items
    }
    
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: columns, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                ForEach(0..<numberOfRows*numberOfRows, id: \.self) { index in
                    GridColorCell(items: items, index: index)
                        .frame(height: geometry.size.height/3, alignment: .center)
                }
            }
        }
    }
    
}

struct GridColorOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        GridColorOverlayView(
            numberOfRows: 3,
            items: [
                
            ]
        )
        .frame(width: 420, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .aspectRatio(0.75, contentMode: .fit)
    }
}
