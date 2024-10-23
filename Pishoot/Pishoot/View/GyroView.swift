//
//  GyroView.swift
//  Pishoot
//
//  Created by Yuriko AIshinselo on 23/10/24.
//

import SwiftUI
struct GyroView: View {
    @ObservedObject var viewModel: GyroViewModel
        var body: some View {
            VStack {
                Spacer().frame(height: 20)
                Button(action: {
                    viewModel.lockGyroCoordinates()
                    viewModel.resetGyroValues()
                }) {
                    Text("Lock Gyroscope")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer().frame(height: 20)

                Text(viewModel.guidanceText)
                    .font(.title)
                    .foregroundColor(viewModel.isSuccess ? .green : .red)
            }
            .onAppear {
                viewModel.startGyros()
            }
            .onDisappear {
                viewModel.stopGyros()
            }
        }
}

#Preview {
    GyroView(viewModel: GyroViewModel())
}
