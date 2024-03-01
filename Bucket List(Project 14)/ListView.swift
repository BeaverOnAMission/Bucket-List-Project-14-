//
//  ListView.swift
//  BucketList
//
//  Created by mac on 27.12.2023.
//

import SwiftUI

struct ListView: View {
    let locations: [Location]
    let deleteItems: (IndexSet) -> Void
    @State private var showMapView = false
    var body: some View {
        Section("Your BucketList!") {
            List{
                ForEach(locations) { location in
                        HStack{
                            VStack(alignment: .leading){
                                Text(location.name)
                                    .font(.title2).bold()
                                Text(location.description)
                                    .font(.body)
                                    
                                
                            }
                            .frame(height: 50)

                            Spacer()
                            if location.type == "Favorite" {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .frame(width:50)
                            }
                        }
                        
                    
                }.onDelete(perform: deleteItems)
            }
        }.padding()
    }
}
