Backend - Flutter

Este é o backend do teste técnico, desenvolvido com Node.js e Express.js, que consome uma API pública e expõe os dados via um endpoint REST.

🚀 Como rodar o backend com Docker

📌 Pré-requisitos:

Antes de iniciar, certifique-se de ter os seguintes requisitos instalados:

Docker - Para containerizar e rodar o backend.

Node.js e NPM - Caso queira rodar o backend sem Docker.

🔧 Passo a passo para rodar com Docker:

Acesse a pasta backend

Crie a imagem Docker:

```
docker build -t backend-flutter-node .
```

Execute o container:

```
docker run -p 8000:8000 backend-flutter-node
```

Acesse o endpoint:
Abra o navegador ou use o Postman para acessar:

```
http://localhost:8000/users
http://localhost:8000/user-posts/${userId}
```
Isso irá retornar os dados consumidos da API pública.

🔧 Passo a passo para rodar sem Docker:

Instale as dependências:

npm install

Execute o servidor:

```
npm start
```

Acesse o endpoint:

```
http://localhost:8000/users
http://localhost:8000/user-posts/${userId}
```

📂 Estrutura do Projeto backend
```
backend/
│-- node_modules/
│-- src/
│   │-- controllers/
│   │-- routes/
│   │-- services/
│   │-- services/
│   │-- app.js
│-- index.js
│-- package.json
│-- Dockerfile
│-- .dockerignore
```

🚀 Como rodar o App Flutter


Acesse app_flutter

Selecione um emulador


📌 Tecnologias Utilizadas

Node.js

Express.js

Axios

Docker




# Frontend - Flutter

## 🚀 Como rodar o projeto Flutter

### 📌 Pré-requisitos:
Antes de iniciar, certifique-se de ter os seguintes requisitos instalados:

- [Flutter](https://flutter.dev/docs/get-started/install) - SDK para desenvolvimento mobile.
- [Dart](https://dart.dev/get-dart) - Linguagem de programação usada no Flutter.
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/) - IDEs recomendadas.
- Um dispositivo físico ou emulador configurado.

### 🔧 Passo a passo para rodar o projeto:
1. **Acesse app_flutter:**
   ```sh
   cd app_flutter
   ```

2. **Instale as dependências:**
   ```sh
   flutter pub get
   ```

3. **Configure o backend:**
   - Certifique-se de que o backend está rodando na porta correta (8000).
   - Altere a URL base da API no código em lib/app/services/api_service.dart e adicione seu IP Local.

4. **Execute o aplicativo:**
   ```sh
   flutter run
   ```

5. **Executando em um dispositivo específico:**
   - Para rodar no Android:
     ```sh
     flutter run -d android
     ```
   - Para rodar no iOS:
     ```sh
     flutter run -d ios
     ```
   - Para rodar no emulador/web:
     ```sh
     flutter run -d chrome
     ```

## 📂 Estrutura do Projeto
```
app_flutter/
│-- lib/
│   │-- app/
│   │   │-- models/
│   │   │-- pages/
│   │   │-- services/
│   │   │-- utils/
│   │-- main.dart
│-- pubspec.yaml
│-- android/
│-- ios/
│-- web/
│-- README.md
```

## 📌 Tecnologias Utilizadas
- Flutter
- Dart
- HTTP (para requisições ao backend)


