//
//  GeneratorViewModel.swift
//  imageGeneratorApp
//
//  Created by ryananda on 29/05/23.
//

import Foundation

extension GeneratorView {
    class ViewModel: ObservableObject {
        @Published var duration = 0
        @Published var image: URL?
        
        let prompt: String
        let selectedStyle: imageStyle
        
        private let openAIService = OpenAIService()
        
        init(prompt: String, selectedStyle: imageStyle) {
            self.prompt = prompt
            self.selectedStyle = selectedStyle
        }
        
        func generateImage() {
            let formattedPrompt = "\(selectedStyle.title) image of \(prompt)"
            
            Task {
                do {
                    let generatedImage = try await openAIService.generateImage(prompt: formattedPrompt)
                    guard let imageURLString = generatedImage.data.first?.url, let imageUrl = URL(string: imageURLString) else {
                        print("Failed to generate image")
                        return
                    }
                    
                    await MainActor.run {
                        self.image = imageUrl
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
    }
}
