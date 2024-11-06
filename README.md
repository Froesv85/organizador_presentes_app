# Organizador de Presentes

## Descrição

O **Organizador de Presentes** é um aplicativo desenvolvido em Flutter que utiliza o Firebase como banco de dados para criar, ler, atualizar e excluir (CRUD) registros de presentes. O objetivo do aplicativo é permitir que os usuários registrem presentes que pretendem dar ou já deram, com uma breve descrição.

## Funcionalidades

- **Adicionar Presente:** Permite adicionar um novo presente com título, descrição e data.
- **Listar Presentes:** Exibe uma lista de presentes registrados, mostrando título e descrição.
- **Editar Presente:** Permite editar as informações de um presente existente.
- **Excluir Presente:** Permite excluir um presente da lista.

## Tecnologias Utilizadas

- **Flutter:** Framework para desenvolvimento de aplicativos móveis.
- **Firebase:** Plataforma de desenvolvimento de aplicativos, utilizada como banco de dados.

## Estrutura do Projeto

organizador_presentes_app/

├── lib/ 

│ ├── main.dart 

│ ├── models/ 

│ │ └── presente.dart

│ ├── screens/ 

│ │ ├── home_screen.dart

│ │ ├── add_presente_screen.dart

│ │ ├── edit_presente_screen.dart

│ ├── services/ 

│ │ └── firebase_service.dart 

│ ├── widgets/ 

│ │ └── presente_tile.dart


## Configuração do Firebase

1. Crie um projeto no Firebase Console.
2. Adicione um novo aplicativo Android/iOS ao projeto Firebase.
3. Siga as instruções para adicionar o arquivo `google-services.json` (Android) ou `GoogleService-Info.plist` (iOS) ao seu projeto Flutter.
4. Adicione as dependências do Firebase ao seu `pubspec.yaml`:


