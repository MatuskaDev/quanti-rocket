 //
//  Created by Lukáš Matuška on 29.02.2024.
//

import SwiftUI
import SharedDomain
import SharedDomainMocks

public struct RocketDetailView: View {
    
    let rocket: Rocket
    
    public init(rocket: Rocket) {
        self.rocket = rocket
    }
    
    public var body: some View {
        ScrollView {
            GeometryReader { geo in
                VStack(alignment: .leading, spacing: 10) {
                    Text("Overview").bold()
                    Text(rocket.description)
                    
                    Text("Parameters").bold()
                    HStack(spacing: 20) {
                        let width = geo.size.width - 40
                        ParameterTile(main: "\(rocket.height.meters)m",
                                      label: "height",
                                      size: width / 3)
                        ParameterTile(main: "\(rocket.diameter.meters)m",
                                      label: "diameter",
                                      size: width / 3)
                        ParameterTile(main: "\(rocket.mass.kg/1000)t",
                                      label: "mass",
                                      size: width / 3)
                    }
                    
                    StageTile(stage: rocket.firstStage, title: "First stage")
                    StageTile(stage: rocket.secondStage, title: "Second stage")
                    
                    Text("Photos").bold()
                    VStack(spacing: 10) {
                        ForEach(rocket.imageUrls, id:\.self) { imgUrl in
                            AsyncImage(url: URL(string: imgUrl)) { image in image.resizable().scaledToFit()
                            } placeholder: { ProgressView() }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(rocket.name)
        }
    }
    
    struct ParameterTile: View {
        
        let main: String
        let label: String
        let size: CGFloat
        
        var body: some View {
            VStack {
                Text(main)
                    .font(.title2.bold())
                Text(label)
            }
            .padding()
            .frame(width: size, height: size)
            .background(Color(asset: Asset.accent))
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    struct StageTile: View {
        
        let stage: RocketStage
        let title: String
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(title).bold()
                    HStack(spacing: 10) {
                        Image(asset: Asset.reusable)
                        Text(stage.reusable ? "reusable" : "not reusable")
                    }
                    HStack(spacing: 10) {
                        Image(asset: Asset.engine)
                        Text("\(stage.engines) engines")
                    }
                    HStack(spacing: 10) {
                        Image(asset: Asset.fuel)
                        Text("\(stage.fuelAmount.formatted()) tons of fuel")
                    }
                    if let burnTime = stage.burnTime {
                        HStack(spacing: 10) {
                            Image(asset: Asset.fuel)
                            Text("\(burnTime.formatted()) seconds burn time")
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    RocketDetailView(rocket: .stub)
}
