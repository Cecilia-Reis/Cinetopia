//
//  Movies.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 06/05/24.
//

import Foundation

class Movie: Decodable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    private(set) var isSelected: Bool? = false
    
    //MARK: - Class methods
    
    func changeSelectionStatus() {
        isSelected = !(isSelected ?? false)
    }
}

/*let Movies : [Movie] = [
    Movie(id: 1,
          title: "A Cinco Passos de Você",
          image: "https://github.com/alura-cursos/movie-api/blob/main/images/barbie.jpg?raw=true",
          synopsis: "Stella passa muito tempo no hospital por causa de uma fibrose cística. Lá, ela conhece Will, que sofre da mesma doença. Eles são obrigados a manter distância, mas mesmo assim se apaixonam.",
          rate: 9.0,
          releaseDate: "21/03/2019"),
    
    Movie(id: 2,
          title: "Alice no País das Maravilhas",
          image: "https://github.com/alura-cursos/movie-api/blob/main/images/barbie.jpg?raw=true",
          synopsis: "Ainda garotinha, Alice Kingsleigh visitou um lugar mágico pela primeira vez e não tinha mais lembranças sobre o local a não ser em seus sonhos. Em uma festa da nobreza, a jovem vê um coelho branco. Alice o segue e cai em um buraco, indo parar em um mundo estranho: o País das Maravilhas. Lá, ela reencontra personagens que estavam guardados em sua memória através dos sonhos.",
          rate: 9.4,
          releaseDate: "25/02/2010"),
    
    Movie(id: 3,
          title: "Wonka",
          image: "https://github.com/alura-cursos/movie-api/blob/main/images/barbie.jpg?raw=true",
          synopsis: "Ainda um jovem adulto, Willy Wonka dá os primeiros passos para se tornar um grande chocolateiro. Ele deseja ter uma pequena loja para poder vender seus doces, mas para isso terá que contar com a ajuda de um homem diminuto chamado Oompa-Loompa e de outras pessoas que também querem alcançar seus sonhos.",
          rate: 8.9,
          releaseDate: "7/12/2023"),
    
    Movie(id: 4, title: "Avatar", 
          image: "https://github.com/alura-cursos/movie-api/blob/main/images/barbie.jpg?raw=true" ,
          synopsis: "A franquia Avatar de James Cameron é uma série planejada de filmes de ficção científica produzidos pela Lightstorm Entertainment e distribuídos pela 20th Century Studios, bem como jogos de computador associados e passeios de parque temático. ",
          rate: 7.5,
          releaseDate:"18/12/2009"),
    
    Movie(id: 5,
          title: "Os Vingadores: Ultimato",
          image: "vingadores",
          synopsis: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.",
          rate: 8.9,
          releaseDate: "25/042019"),
    
    Movie(id: 6, 
          title: "O Rei Leão”",
          image: "reiLeao",
          synopsis: "Este desenho animado da Disney mostra as aventuras de um leão jovem de nome Simba, o herdeiro de seu pai, Mufasa. O tio malvado de Simba, Oscar, planeja roubar o trono de Mufasa atraindo pai e filho para uma emboscada. Simba consegue escapar e somente Mufasa morre. Com a ajuda de seus amigos,Timon e Pumba, ele reaparece como adulto para recuperar sua terra, que foi roubada por seu tio Oscar.",
          rate: 7.0,
          releaseDate: "8/07/1994"),
    
    Movie(id: 7, 
          title: "Harry Potter e a Pedra Filosofal",
          image: "HarryPotter",
          synopsis: "Harry Potter é um garoto órfão que vive infeliz com seus tios, os Dursleys. Ele recebe uma carta contendo um convite para ingressar em Hogwarts, uma famosa escola especializada em formar jovens bruxos. Inicialmente, Harry é impedido de ler a carta por seu tio, mas logo recebe a visita de Hagrid, o guarda-caça de Hogwarts, que chega para levá-lo até a escola. Harry adentra um mundo mágico que jamais imaginara, vivendo diversas aventuras com seus novos amigos, Rony Weasley e Hermione Granger.",
          rate: 7.5,
          releaseDate: "23/11/2001")
]*/
