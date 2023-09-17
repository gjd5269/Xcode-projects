import SwiftUI

struct RandomButton:View{
    var Ran : String
    var body:some View{
        Text("\(Ran)")
            .frame(width: 100,height: 50)
            .font(.system(size:20,weight:.bold))
            .foregroundColor(Color.white)
            .background(Color.red)
            .clipShape(Rectangle())
            .padding()
        
    }
}
struct RandomButton_Preview:PreviewProvider{
    static var previews: some View{
       RandomButton(Ran: "Random")
    }
}
