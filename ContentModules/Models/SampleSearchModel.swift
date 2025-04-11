//
//  SampleSearchModel.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//
import MapKit
import CoreLocation
import Combine

class SampleSearchModel {
    private let geocoder = CLGeocoder()

    func search(query: String, completion: @escaping (Result<[CLPlacemark], Error>) -> Void) {
        geocoder.geocodeAddressString(query) { placemarks, error in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            completion(.success(placemarks ?? []))
        }
    }
}

class SampleSearchWidgetModel {
    let resultsTableState = TableState(content: [])
    let searchState = SearchState(result: MessageState(title: "Search", message: "Please type in"))
    let model = SampleSearchModel()
    var bag: Set<AnyCancellable> = []

    func ready() {
        searchState.$query
            .debounce(for: 3.0, scheduler: RunLoop.main)
            .sink { [weak self] query in
                guard let self else { return }

                self.searchState.result = MessageState(title: "Loading", message: "...")

                model.search(query: query) { result in
                    do {
                        let results = try result.get()

                        let rows = results.map { self.row(for: $0) }
                        self.resultsTableState.content = rows
                        self.searchState.result = self.resultsTableState
                    } catch {
                        self.searchState.result = MessageState(title: "Error", message: error.localizedDescription)
                    }
                }
            }
            .store(in: &bag)
    }

    func row(for placemark: CLPlacemark) -> AmenityState {
        let addressComponents = [
            placemark.thoroughfare,
            placemark.subThoroughfare,
            placemark.administrativeArea,
            placemark.postalCode
        ].compactMap { $0 }

        let addressString = addressComponents.joined(separator: ", ")

        return AmenityState(
            name: placemark.name ?? "-",
            address: addressString,
            icon: placemark.iconURL
        )
    }
}

extension CLPlacemark {
    var placeIconSystemName: String {
        if name?.lowercased().contains("airport") == true {
            return "airplane"
        } else if name?.lowercased().contains("park") == true {
            return "leaf"
        } else if locality != nil {
            return "building.2"
        } else if ocean != nil {
            return "drop"
        } else if inlandWater != nil {
            return "wave.3.forward"
        } else {
            return "mappin.circle"
        }
    }
}

extension CLPlacemark {
    var iconURL: URL {
        let baseURL = "https://raw.githubusercontent.com/mapbox/maki/main/icons/" // Replace with your CDN or API

        if name?.lowercased().contains("airport") == true {
            return URL(string: baseURL + "airport.png")!
        } else if name?.lowercased().contains("park") == true {
            return URL(string: baseURL + "park.png")!
        } else if locality != nil {
            return URL(string: baseURL + "city.png")!
        } else {
            return URL(string: baseURL + "default.png")!
        }
    }
}
