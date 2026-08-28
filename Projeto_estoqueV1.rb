require 'active_record'

# 1-Configurações do BD
ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    username: 'postgres',
    password: '****',
    database: 'estoque'
)

# 2- Definição do esquema do BD
ActiveRecord::Schema.define do
    create_table :categories, if_not_exists: true do |t|
        t.string :name
    end

    create_table :products, if_not_exists: true do |t|
        t.string :name
        t.integer :category_id
        t.integer :stock_quantity, default: 0
    end
end

# 3- Definição dos modelos.
class Category < ActiveRecord::Base
    has_many :products
end

class Product < ActiveRecord::Base
    belongs_to :category

    def decrease_stock(amount)
        if self.stock_quantity >= amount
            self.stock_quantity -= amount
            self.save
        else
            puts "Estoque insuficiente para o produto #{self.name}."
        end
    end

    def increase_stock(amount)
        self.stock_quantity += amount
        self.save
    end
end

# 4-Utilizando os modelos.
category = Category.create(name: 'Eletrônicos')
product = Product.create(name: 'Notebook', category_id: category.id, stock_quantity: 10)

puts "Produto criado: #{product.name}"
puts "Estoque inicial: #{product.stock_quantity}"

product.increase_stock(5)
puts "Após aumentar 5 unidades: #{product.stock_quantity}"

product.decrease_stock(3)
puts "Após diminuir 3 unidades: #{product.stock_quantity}"

puts "\n--- Listando todos os produtos ---"
Product.all.each do |p|
    puts "#{p.name}: #{p.stock_quantity} unidades (Categoria: #{p.category.name})"
end
