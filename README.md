# Flutter Hyrule

Este projeto é fruto do curso de 'Flutter: praticando e adaptando arquitetura limpa' da plataforma ALURA

## Introdução

Este projeto tem o intuito de estudar a evolução de um aplicativo utilizando a metodologia de arquitetura limpa "Clean Architecture"

A metodologia de arquitetura limpa, ou "Clean Architecture", é uma abordagem projetada para criar sistemas de software robustos, escaláveis e de fácil manutenção. Ela é baseada em princípios que visam a separação de responsabilidades, o que facilita a evolução e manutenção do código ao longo do tempo. A imagem que você forneceu parece ilustrar um conceito central da arquitetura limpa, que é a organização em camadas, cada uma com uma responsabilidade bem definida.

### Estrutura da Arquitetura Limpa Conforme a Imagem

- Domínio :

  - Descrição: Esta é a camada mais interna e contém as regras de negócio fundamentais, ou lógica de domínio. É independente de frameworks e bibliotecas externas, o que significa que pode ser testada e usada isoladamente. Os componentes desta camada são as entidades e os casos de uso que representam o coração do sistema.
  - Evolução: O código nesta camada muda raramente, apenas quando há mudanças significativas nas regras de negócio.

- Dados:

  - Descrição: Esta camada é responsável por definir interfaces para comunicação com fontes de dados, como bancos de dados ou APIs externas. A ideia é isolar a lógica de acesso a dados, facilitando mudanças nos mecanismos de persistência sem impactar as regras de negócio.
  - Evolução: A camada de dados evolui para suportar novas fontes ou mecanismos de armazenamento e recuperação de dados.
 
- Utils:

  - Descrição: A camada de utilitários inclui componentes e serviços auxiliares que oferecem suporte às operações principais do sistema. Ela pode conter funções comuns ou serviços que são reutilizáveis em diferentes partes do aplicativo.

  - Evolução: À medida que o aplicativo cresce, mais utilitários podem ser adicionados para lidar com novas necessidades.

- Controller:

  - Descrição: Nesta camada, os controladores são responsáveis por orquestrar a execução dos casos de uso. Eles recebem entradas dos usuários, interagem com a camada de domínio e coordenam as operações necessárias.
  - Evolução: A camada de controle pode evoluir para adicionar mais casos de uso ou adaptar-se a novos requisitos de interação do usuário.

- Presenter:

  - Descrição: A camada de apresentação é responsável por preparar os dados para exibição na interface do usuário (UI). Aqui, os presenters formatam e adaptam os dados de forma que a UI possa facilmente consumi-los. Ela age como um intermediário entre a UI e as camadas internas.
  
  - Evolução: Esta camada evolui junto com mudanças na interface do usuário e na maneira como os dados precisam ser exibidos ou processados para o usuário final.



## Apresentação do projeto

Este projeto é voltado para o consumo da **Hyrule Compendium API**, uma API baseada em informações do jogo "The Legend of Zelda: Breath of the Wild". Esta API permite que desenvolvedores acessem dados detalhados sobre diferentes elementos do jogo, como criaturas, equipamentos, materiais, inimigos e tesouros.

https://gadhagod.github.io/Hyrule-Compendium-API/#/compendium-api

Seguindo a documentação fornecida via figma o aplicativo devem ser desenvolvidas as seguintes telas

   - tela de Página de Categorias  (Categories)
   - tela de Listagem de Criaturas e Detalhes (Results)  
   - tela de detalhes   (Details)
   - tela de Itens Salvos  (Favorities)
 

<img src="info/projeto figma.png" alt="local servidor web api" width="300"/>

A apresentação e feita por Categorias que ao clicar  se vai para Resultados onde é ao se clicar em um item e aberta a tela de detalhes onde se adiciona a favoritos

obs: as informações de favoritos é armazenada localmente em 'sqflite' e as apresentações vem da api

<img src="info/app.gif" alt="local servidor web api" width="300"/>

## Configurações do Ambiente


### Tópicos abordados no curso

- Definir a camada de domínio da aplicação;
- Criar a entidade/modelo que servirá como base de informações e funcionalidades de visualizar, salvar e deletar entradas;
- Descrever as regras de negócios da API e banco de dados.
- Criar parte da camada de dados da aplicação:
- Como listar, adicionar, atualizar e remover dados;
- Como criar um database com as bibliotecas floor e sqflite;
- Saber quando e como acoplar a aplicação para evitar grandes problemas em um aplicativo Flutter.
- Instalar a biblioteca DIO;
- Utilizar a biblioteca dentro do projeto;
- Aplicar a camada utils, entendendo sua utilidade para um projeto.
- Entender a importância da camada controller e intermediar os dados entre a camada de dados e UI;
- Implementar um controller na sua aplicação para a busca na API;
- Aplicar um controller na sua aplicação para gerenciamento dos métodos de banco de dados.
- Adicionar mais informações dentro da camada de utils;
- Importância da funcionalidade antes da estilização de componentes e páginas;
- Integrar as telas com a API utilizando a camada de controller.
- Salvar uma entrada utilizando o Controller;
- Concluir a interface básica da aplicação;
- Finalizar a integração entre Controller e Presenter.


### Funcionalidades estudadas no projeto


1. **Página de Categorias**:
   - **Descrição**: Uma página que lista várias categorias disponíveis no compêndio de Hyrule. Os usuários podem escolher uma categoria para explorar.
   - **Exemplo de Uso**: Selecionar a categoria "Creatures" para ver as opções de criaturas disponíveis, que são carregadas dinamicamente através de uma API.

2. **Listagem de Criaturas e Detalhes**:
   - **Descrição**: Ao clicar em uma categoria como "Creatures", o aplicativo exibe uma lista de criaturas. Cada item na lista pode ser clicado para visualizar detalhes específicos da criatura.
   - **Exemplo de Uso**: Exibir uma descrição detalhada de uma criatura específica ao clicar nela.

3. **Adicionar Nova Entrada**:
   - **Descrição**: Funcionalidade para adicionar uma nova entrada ao banco de dados. Isso é feito clicando em um botão azul com um quadrado branco menor dentro, localizado no canto inferior direito da tela de detalhes.
   - **Exemplo de Uso**: Usuário pode adicionar uma criatura ou item à sua coleção pessoal clicando no botão de adição.

4. **Página de Itens Salvos**:
   - **Descrição**: Uma página onde os usuários podem visualizar todos os itens que foram salvos no banco de dados. Esta página permite verificar se um item foi adicionado com sucesso.
   - **Funcionalidades Adicionais**:
     - **Visualização de Entradas Salvas**: Exibir todas as entradas que foram adicionadas ao banco de dados.
     - **Excluir Entradas**: Opção para remover entradas salvas do banco de dados.

5. **Uso de API para Carregar Dados**:
   - **Descrição**: Implementação de chamadas a uma API para carregar dinamicamente dados do compêndio, como as diferentes criaturas. Isso permite que o aplicativo seja atualizado com novos dados sem a necessidade de alterações no código.

6. **Arquitetura Clean (Clean Architecture)**:
   - **Descrição**: Implementação de uma arquitetura de software estruturada para facilitar a manutenção e a escalabilidade do aplicativo. A arquitetura foi adaptada para o contexto de um projeto Flutter.
   - **Camadas Incluídas**:
     - **Camada de Domínio**: Contém as regras de negócios e os modelos (definidos em `domain`).
     - **Camada de Dados**: Responsável por obter e armazenar dados, incluindo a configuração de um banco de dados usando a biblioteca Floor e integração com APIs usando o Dio.
     - **Controladores e Camada de Apresentação**: Controladores para conectar a lógica de negócios com as telas do aplicativo.

 
 
