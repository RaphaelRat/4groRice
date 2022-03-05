# 4groRice

Um aplicativo em desenvolvimento para a disciplina Projeto Integrador I (DEC0013) do curso de Engenharia de Computação da UFSC (Universidade Federal de Santa Catarina);

A ideia do aplicativo é facilitar a vida do agricultor no plantio de arroz (Em breve mais detalhes).
Em breve estarei linkando com o artigo.

#### Integrantes:
* Igor Enrick - [LinkedIn](https://www.linkedin.com/in/igorenrick/), [GitHub](https://github.com/igorenrick)
* Ivan Gabriel - [GitHub](https://github.com/R3N3GAD0)
* Jhennifer Matias - [LinkedIn](https://www.linkedin.com/in/jhennifer-m-170818122/), [GitHub](https://github.com/jhennymatias)
* Lucca Machado - [LinkedIn](https://www.linkedin.com/in/lucca-machado-da-silva-5072a3194/), [GitHub](https://github.com/LuccaMS)
* Miguel Garcia - [LinkedIn](https://www.linkedin.com/in/miguel-garcia-silvestre-3265ab19b/), [GitHub](https://github.com/miguelsrrobo)
* Raphael Abreu  - [LinkedIn](https://www.linkedin.com/in/raphaelrat/), [GitHub](https://github.com/RaphaelRat)
* Vitória Mochovik - [GitHub](https://github.com/VitoriaMochovik)

---

>Aplicativo desenvolvido em Flutter com o [back-end](https://github.com/LuccaMS/BackEndPi1) feio em [Strapi](https://strapi.io/). Flutter/Strapi doc: [CRUD](https://strapi.io/blog/how-to-build-a-simple-crud-application-using-flutter-and-strapi)

---

## Doc para os devs:

Para gerenciamento de estado estamos usando [GetX](https://pub.dev/packages/get) e como design pattern esse [aqui](https://github.com/kauemurakami/getx_pattern).

O Flutter utilizado no projeto está na versão 2.10.3 e além de app mobile, também estamos implementando a versão web e desktop.

Resumindo as pastas e seus significados:

### App

É a pasta principal onde está localizado todos os arquivos da aplicação, com exceção dos assets, que fica fora.

### Core (ainda n tem) 

É a pasta onde colocamos os utils, que são utilizadores que usamos em todo código se necessário, onde também adicionamos o theme e também os globals (como auth_controller).

### Data

É a pasta onde temos: provider, services, enums e models. Em resumo é a pasta responsavel por criar os modelos, a conexão com a api, etc.

### Global Widgets

É a pasta onde salvamos todos os Widgets que são usados globalmente no aplicativo, como por exemplo o ResponsiveContainer, responsável por limitar a expansão dos widgets para ser exibido nos navegadores web.

### Modules

É aqui onde a mágica acontece, lugar mais feliz pros Front-End de plantão, é onde você tem todas as ui / screen / telas / páginas do aplicativo, e pode chamar como quiser, mas por padrão chamaremos de nome_page. Dentro de modules, temos especificado em cada pasta qual a tela, por exemplo o arquivo login_page.dart está dentro da pasta "login", isso por que começaremos a implementar o GetX e com isso criaremos o arquivo login_controller.dart que ficara dentro da mesma pasta e será responsável por gerenciar o estado da página em si. Obs: no projeto, as 3 páginas exibidas no home, estão dentro da pasta home, cada uma em sua própria pasta também.

### Routes

É a pasta responsável por salvar as rotas e as páginas para serem usadas na troca de páginas. 
