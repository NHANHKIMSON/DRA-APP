//
//  FontListView.swift
//  RDA
//
//  Created by Apple on 10/3/25.
//

import SwiftUI


struct FontListView: View {
    let families = UIFont.familyNames.sorted()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(families, id: \.self) { family in
                    Section(header: Text(family)) {
                        ForEach(UIFont.fontNames(forFamilyName: family).sorted(), id: \.self) { fontName in
                            Text(fontName)
                                .font(.custom(fontName, size: 16))
                        }
                    }
                }
            }
            .navigationTitle("Available Fonts")
        }
    }
}

#Preview {
    FontListView()
}
