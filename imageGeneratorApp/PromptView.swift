//
//  ContentView.swift
//  imageGeneratorApp
//
//  Created by ryananda on 29/05/23.
//

import SwiftUI

struct PromptView: View {
    
    @State var selectedStyle = imageStyle.allCases[0]
    @State var promptText: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Generate")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("Choose a Style")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                GeometryReader {reader in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(imageStyle.allCases, id: \.self) {
                                imageStyle in
                                Button {
                                    selectedStyle = imageStyle
                                } label: {
                                    Image(imageStyle.rawValue)
                                        .resizable().background(Color.blue) .scaledToFill() .frame(width: reader.size.width * 0.4, height: reader.size.width * 0.4 * 1.4)
                                    
                                        .overlay{
                                            RoundedRectangle(cornerRadius: 20).stroke(Color.yellow, lineWidth: imageStyle == selectedStyle ? 3 : 0)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                                
                                
                            }
                        }
                    }
                }
                Spacer()
                Text("Enter a Prompt")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                TextEditor(text: $promptText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .tint(Color.yellow)
                
                VStack (alignment: .center){
                    NavigationLink {
                        GeneratorView(viewModel: .init(prompt: promptText, selectedStyle: selectedStyle))
                    } label: {
                        Text("Generate Images")
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius:20))
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.black
                .edgesIgnoringSafeArea(.all))
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView()
    }
}
