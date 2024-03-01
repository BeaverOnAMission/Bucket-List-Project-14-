//
//  ContentView.swift
//  Bucket List(Project 14)
//
//  Created by mac on 15.07.2023.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showListView = false
    var body: some View {
      if viewModel.unLocked{
            ZStack{
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate ){
                        VStack{
                            if location.type == "Other"{
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width:35, height: 35)
                                    .background(.secondary)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width:35, height: 35)
                                    .background(.secondary)
                                    .clipShape(Circle())
                            }
                            Text(location.name)
                                .font(.system(size: 12, weight: .semibold))
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()
                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32)
                
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            showListView = true
                        } label: {
                            Image(systemName: "list.clipboard")
                        }
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.leading)
                        Spacer()
                        Button {
                            viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
                .sheet(item: $viewModel.selectedPlace){place in
                    EditView(location: place){ newLocation in
                        viewModel.update(location: newLocation)
                    }
                    .presentationDetents([.medium])
                }
            }.sheet(isPresented: $showListView) {
                ListView(locations: viewModel.locations, deleteItems: viewModel.deleteItems)
            }
        } else {
            Button ("unlock") {
                viewModel.authenticate()
            }
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
