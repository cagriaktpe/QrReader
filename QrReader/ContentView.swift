//
//  ContentView.swift
//  QrReader
//
//  Created by Samet Çağrı Aktepe on 14.03.2024.
//

import CodeScanner
import SwiftUI

// TODO: Appearance - light

struct ContentView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String = "Scan a QR code to get started."

    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
                .padding()
            
            Button("Scan QR code") {
                self.isPresentingScanner = true
            }
        }
        .sheet(isPresented: $isPresentingScanner) {
            self.scannerSheet
        }
    }

    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
}

#Preview {
    ContentView()
}
