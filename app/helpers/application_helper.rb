module ApplicationHelper
  def carpros_sum(carpros)
    sum = 0
    carpros.each do |carpro|
      sum += (carpro.quantity * carpro.product.price)
    end
    sum
  end
end
