
README - MarvelController

Este código é um exemplo de implementação de uma view controller chamada MarvelController que exibe uma lista de filmes da Marvel em uma coleção. Ele utiliza a biblioteca UIKit para criar a interface do usuário.

Funcionalidades

Exibe uma coleção de filmes da Marvel.
Permite interagir com a coleção através de seleção de itens.
Carrega os dados dos filmes de uma API.
Como usar

Importe o framework UIKit no seu projeto.
Crie uma instância da classe MarvelController.
Adicione a instância criada à hierarquia de views do seu aplicativo.
A interface do usuário será exibida, com uma coleção de filmes da Marvel.
Detalhes de implementação

Propriedades
api: Array de objetos MovieData, que armazena os dados dos filmes da Marvel carregados da API.
Método viewDidLoad()
Configura a aparência da view controller, definindo a cor de fundo da view e ocultando o botão de voltar.
Configura a coleção e o botão, adicionando-os à hierarquia de views.
Define o data source e o delegate da coleção.
Registra a classe ProfileCell como a célula reutilizável da coleção.
Métodos setupViews() e setupLayouts()
Configuram as views da interface e suas restrições de layout.
Método startApi()
Realiza a chamada à API MarvelApi.serviceApi() para obter os dados dos filmes da Marvel.
Atualiza a propriedade api com os dados retornados da API.
Recarrega a coleção na main thread.
Método buttonTapped()
Realiza a mesma ação do método startApi(), chamando a API para atualizar os dados e recarregar a coleção.
Extensão UICollectionViewDataSource e UICollectionViewDelegateFlowLayout
Implementam os métodos necessários para configurar a coleção e suas células.
O método numberOfItemsInSection retorna o número de itens na coleção, baseado no tamanho do array api.
O método cellForItemAt configura as células da coleção com os dados dos filmes.
O método layout define as margens e o espaçamento entre as células.
O método didSelectItemAt é chamado quando um item da coleção é selecionado, apresentando uma view chamada AnotherMarvel com o título do filme selecionado.
O método sizeForItemAt define o tamanho das células da coleção.
Observações

Certifique-se de ter importado o framework UIKit no seu projeto antes de utilizar essa classe.
Verifique se a API MarvelApi está corretamente implementada e acessível a partir desta classe.
A aparência da coleção e do botão pode ser personalizada alterando as propriedades correspondentes.
As células da coleção são configuradas usando a classe ProfileCell, portanto, certifique-se de ter implementado corretamente essa classe.
Este código assume que o usuário possui conhecimento prévio sobre como criar uma instância de MarvelController e adicioná-la corretamente à hierarquia de views do aplicativo.
