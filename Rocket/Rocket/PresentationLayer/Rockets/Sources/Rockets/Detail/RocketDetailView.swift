 //
//  Created by Lukáš Matuška on 29.02.2024.
//

import SwiftUI
import SharedDomain
import SharedDomainMocks
import UIToolkit

struct RocketDetailView: View {
    
    @ObservedObject var model: RocketDetailViewModel
    
    init(model: RocketDetailViewModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Overview").bold()
                    Text(model.state.rocket.description)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Parameters").bold()
                    HStack(spacing: 20) {
                        let width = geo.size.width - 40 - 30
                        ParameterTile(main: "\(String(format: "%.1f", model.state.rocket.height.meters))m",
                                      label: "height",
                                      size: width / 3)
                        ParameterTile(main: "\(String(format: "%.1f", model.state.rocket.diameter.meters))m",
                                      label: "diameter",
                                      size: width / 3)
                        ParameterTile(main: "\(String(format: "%.1f", model.state.rocket.mass.kg/1000))t",
                                      label: "mass",
                                      size: width / 3)
                    }
                    
                    StageTile(stage: model.state.rocket.firstStage, title: "First stage")
                    StageTile(stage: model.state.rocket.secondStage, title: "Second stage")
                    
                    Text("Photos").bold()
                    VStack(spacing: 10) {
                        ForEach(model.state.rocket.imageUrls, id:\.self) { imgUrl in
                            AsyncImage(url: URL(string: imgUrl)) { image in image.resizable().scaledToFit()
                            } placeholder: { ProgressView() }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    
                }
                .padding(15)
            }
        }
        .navigationTitle(model.state.rocket.name)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Launch") {
                    model.onIntent(.launchRocket)
                }
            }
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
            .background(Asset.Colors.accent.color)
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
                        Asset.Images.reusable.image
                        Text(stage.reusable ? "reusable" : "not reusable")
                    }
                    HStack(spacing: 10) {
                        Asset.Images.engine.image
                        Text("\(stage.engines) engines")
                    }
                    HStack(spacing: 10) {
                        Asset.Images.fuel.image
                        Text("\(stage.fuelAmount.formatted()) tons of fuel")
                    }
                    if let burnTime = stage.burnTime {
                        HStack(spacing: 10) {
                            Asset.Images.burn.image
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
    NavigationStack {
        RocketDetailView(model: .init(flowController: nil, rocket: .stub))
    }
}
