//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
//

import Foundation


final class CitiesPresenter {
    weak var view: CitiesViewInput?
    let interactor: CitiesInteractorInput
    let router: CitiesRouterInput
    
    init(interactor: CitiesInteractorInput,
         router: CitiesRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private var cityServiceInfos: [CityServiceInfo] = [
        CityServiceInfo(name: "Moscow", id: "524901"),
        CityServiceInfo(name: "Dubai", id: "292223"),
    ]
    
    private (set) var citiesViewModels: [CityViewModel] = []
}


extension CitiesPresenter: CitiesViewOutput {
    func didLoadView() {
        interactor.load(cities: cityServiceInfos)
    }
    
    func didPullRefesh() {
        interactor.load(cities: cityServiceInfos)
    }
    
    func didTapAddButton() {
        router.openCities()
    }
}


extension CitiesPresenter: CitiesInteractorOutput {
    func didLoad(cities: [CityResponse]) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        let citiesViewModels = cities.map { city in
            return CityViewModel(title: city.name,
                                 temperature: String(Int(round(city.main.temp))),
                                 dateUpdate: dateFormatter.string(from: Date()),
                                 systemImageName: "pencil")
        }
        
        self.citiesViewModels = citiesViewModels
        
        self.view?.reloadData()
    }
}
