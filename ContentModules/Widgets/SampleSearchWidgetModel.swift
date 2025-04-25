//
//  SampleSearchModel.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//
import MapKit
import CoreLocation
import Combine
import ContentModulesPackage

class SampleSearchModel {
    private let geocoder = CLGeocoder()

    func search(query: String, completion: @escaping (Result<[CLPlacemark], Error>) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query  // e.g., "coffee", "museum"
        request.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.0, longitude: 0),
            latitudinalMeters: 50000,
            longitudinalMeters: 50000
        )

        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let error {
                print("Geocoding error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            guard let response = response else {
                completion(.failure(NSError(domain: "no response", code: 1)))
                print("Search error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            let placemarks = response.mapItems.map { $0.placemark }
            completion(.success(placemarks))
        }
//        geocoder.geocodeAddressString(query) { placemarks, error in
//            if let error = error {
//                print("Geocoding error: \(error.localizedDescription)")
//                completion(.failure(error))
//                return
//            }
//
//            completion(.success(placemarks ?? []))
//        }
    }
}

class SampleSearchWidgetModel {
    let resultsTableState = TableState(content: [])
    let searchState = SearchState(result: MessageState(title: "Search", message: "Please type in"))

    @Published var selectedResult: CLPlacemark?

    @Published var feedContent: [any TablePresentableState] = []
    @Published var mapContent: [any MapPresentableState] = []
    @Published var actrive: Bool = false

    let model = SampleSearchModel()
    var bag: Set<AnyCancellable> = []


    init() {
        ready()
    }

    func ready() {
        searchState.$query
            .debounce(for: 3.0, scheduler: RunLoop.main)
            .sink { [unowned self] query in
                guard !query.isEmpty else {
                    self.searchState.result = MessageState(title: "Search", message: "Please type in")
                    self.mapContent = []
                    self.actrive = false
                    return
                }

                self.searchState.result = MessageState(title: "Loading", message: "...")
                self.actrive = true

                model.search(query: query) { result in
                    do {
                        let results = try result.get()

                        let rows = results.map { self.row(for: $0) }

                        self.resultsTableState.content = rows
                        self.searchState.result = self.resultsTableState
                        self.mapContent = results.compactMap { self.flag(for: $0) }

                    } catch {
                        self.searchState.result = MessageState(title: "Error", message: error.localizedDescription)
                    }
                }
            }
            .store(in: &bag)

        feedContent = [searchState]
    }

    func flag(for placemark: CLPlacemark) -> (any MapPresentableState)? {
        guard
            let locaiton = placemark.location,
            let name = placemark.name
        else { return nil }
        return FlagMapState(coordinate: locaiton.coordinate, name: name, color: Color(hex: 0xFF0000)).onSelect { [weak self] in
            self?.selectedResult = placemark
        }
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
