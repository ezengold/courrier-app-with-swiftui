//
//  ContentView.swift
//  CourrierApp
//
//  Created by ezen on 14/07/2022.
//

import SwiftUI

struct ContentView: View {
	
	var body: some View {
		LoginScreen()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 12")
	}
}
