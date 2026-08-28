# 📦 Projeto Estoque

Um sistema de gerenciamento de estoque desenvolvido em **Ruby** com **ActiveRecord** e **PostgreSQL**.

## 🎯 Funcionalidades

- ✅ Gerenciar categorias de produtos
- ✅ Cadastrar produtos com controle de estoque
- ✅ Aumentar/diminuir quantidade de estoque
- ✅ Validação de estoque insuficiente
- ✅ Listagem de produtos por categoria

## 🛠️ Tecnologias

- **Ruby** - Linguagem de programação
- **ActiveRecord** - ORM para banco de dados
- **PostgreSQL** - Banco de dados relacional

## 🚀 Como Usar

### 1. Pré-requisitos

- Ruby 3.0+
- PostgreSQL instalado e rodando

### 2. Configurar banco de dados

Edite o arquivo `Projeto_estoque.rb` e configure as credenciais:

```ruby
ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    username: 'postgres',
    password: 'sua_senha',
    database: 'estoque'
)
```

### 3. Executar o projeto

```bash
ruby Projeto_estoque.rb
```

## 💡 Exemplos de Uso

```ruby
# Criar categoria
category = Category.create(name: 'Eletrônicos')

# Criar produto
product = Product.create(name: 'Notebook', category_id: category.id, stock_quantity: 10)

# Aumentar estoque
product.increase_stock(5)

# Diminuir estoque
product.decrease_stock(3)

# Listar todos os produtos
Product.all.each { |p| puts "#{p.name}: #{p.stock_quantity} unidades" }
```

## 📝 Estrutura

- `Projeto_estoque.rb` - Arquivo principal com modelos e lógica

## 👤 Autor

André Moreira

## 📄 Licença

Este projeto é open source sob a licença MIT.
