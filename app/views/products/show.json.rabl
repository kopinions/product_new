object @product
attribute :name, :description
node :uri do |product|
    product_path product
end