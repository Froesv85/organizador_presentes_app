# Organizador de Presentes

## Descrição

O **Organizador de Presentes** é um aplicativo desenvolvido em Flutter que utiliza o Firebase como banco de dados para criar, ler, atualizar e excluir (CRUD) registros de presentes. O objetivo do aplicativo é permitir que os usuários registrem presentes que pretendem dar ou já deram, com uma breve descrição.

Foi desenvolvido por VINICIUS FROES. Com intuito de atender os pré-requisitos levantado pela professora TASSIANA KAUTZMANN na materia Desenvolvimento em Aplicativos Moveis 
## AVALIAÇÃO N2
## CENTRO UNIVERSITÁRIO – CATÓLICA DE SANTA CATARINA 
## JARAGUA DO SUL - SANTA CATARINA


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





