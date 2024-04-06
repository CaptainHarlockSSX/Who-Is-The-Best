//
//  ModelContainerPreview.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 06/04/2024.
//
//  For this sample data :
//
//  Copyright © 2023 Apple Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
//	and associated documentation files (the "Software"), to deal in the Software without restriction,
//	including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//	IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import SwiftUI
import SwiftData

struct ModelContainerPreview<Content: View>: View {
	var content: () -> Content
	let container: ModelContainer

	/// Creates an instance of the model container preview.
	///
	/// This view creates the model container before displaying the preview
	/// content. The view is intended for use in previews only.
	///
	/// - Parameters:
	///   - content: A view that describes the content to preview.
	///   - modelContainer: A closure that returns a model container.
	init(@ViewBuilder content: @escaping () -> Content, modelContainer: @escaping () throws -> ModelContainer) {
		self.content = content
		do {
			self.container = try MainActor.assumeIsolated(modelContainer)
		} catch {
			fatalError("Failed to create the preview model container: \(error.localizedDescription)")
		}
	}

	/// Creates a view that creates the provided model container before displaying
	/// the preview content.
	///
	/// This view creates the model container before displaying the preview
	/// content. The view is intended for use in previews only.
	///
	/// - Parameters:
	///   - modelContainer: A closure that returns a model container.
	///   - content: A view that describes the content to preview.
	init(_ modelContainer: @escaping () throws -> ModelContainer, @ViewBuilder content: @escaping () -> Content) {
		self.init(content: content, modelContainer: modelContainer)
	}

	var body: some View {
		content()
			.modelContainer(container)
	}
}
