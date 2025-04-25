# 📱 InTECHtual – Checklist Inteligente de Estudos

Sua rotina de estudos personalizada. Protótipo de app mobile que cria rotinas de estudos personalizadas com base em dados cognitivos.

👨‍💻 **Colaboradores:** Cauê Santi, Diogo Augusto Benedet, João Pedro Vogel Costa, Luís Miguel Torres R. e Miguel Marocco.

## 🚀 Sobre o projeto

Desenvolvido como proposta de aplicação educacional, o InTECHtual analisa o perfil do usuário e sugere rotinas ideais com base em métricas cognitivas e de comportamento.

## 🛠️ Ferramentas:

- **Front:** Canva, Swift, SwiftUI, XCode.
- **Back:** IBM Cloudant, Node-RED, Swift, Postman.
- **API Notícias:** https://newsdata.io/api/1/latest?apikey=pub_44656b7eac5f5fd4bc6970acccd7d677e750b&q=pegasus&language=en

## 🛣️ Rotas:
### 👨‍🎨 Front:
- `/swift/Ajustes` - Página de Ajustes.
- `/swift/Checklist` - Página de Checklist.
- `/swift/Noticias` - Página de Notícias.
- `/swift/Testes` - Página de Testes de Personalidade.
- `/wireframes` - Wireframes das telas.

### 🌐 Back:
- `/node_red.json` - Esquema feito no Node-RED com *Cloudant* para enviar os dados para a API.
- `/swift/Noticias/Structs` - Struct e conexão para puxar a API de Notícias.
- `/swift/Checklist/Structs` - Struct e conexão para puxar/conectar/atualizar a/à API feita no Node-RED.

## 🎯 Funcionalidades

- Avaliação cognitiva inicial
- Geração automática de checklist de estudos
- Interface intuitiva e responsiva
- Histórico de progresso

## 📦 Como rodar

- Abrir o projeto no Xcode
- Selecionar um simulador iOS
- Rodar o app com o botão ▶️
