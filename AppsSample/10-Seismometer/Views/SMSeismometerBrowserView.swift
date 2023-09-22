//
//  SMSeismometerBrowserView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/22.
//

import SwiftUI

struct SMSeismometerBrowserView: View {
    
    @StateObject private var detector = BLMotionDetector(updateInterval: 0.01)
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: SMNeedleSeismometerView()) {
                    HStack(content: {
                        Image(systemName: "gauge")
                            .foregroundColor(Color.accentColor)
                            .padding()
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Needle")
                                .font(.headline)
                            Text("A needle that responds to the device's vibration.")
                                .font(.caption)
                        })
                        .padding(.trailing)
                    })
                }.padding([.top, .bottom])
                
                NavigationLink(destination: SMGraphSeismometerView()) {
                    HStack(content: {
                        Image(systemName: "waveform.path.ecg.rectangle")
                            .foregroundColor(.accentColor)
                            .padding()
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Graph")
                                .font(.headline)
                            Text("Watch the device's vibrations charted on agraph. Adjust the sensitivity using a slider")
                                .font(.caption)
                        })
                        .padding(.trailing)
                    })
                }
                .padding([.top, .bottom])
            }
            .listStyle(.plain)
            .navigationTitle(Text("Seismometer"))
        } detail: {
            Text("Select a Seismometer Example")
        }
        .environmentObject(detector)
        .onAppear {
            detector.start()
        }
        .onDisappear(perform: {
            detector.stop()
        })
    }
}

#Preview {
    SMSeismometerBrowserView()
}
