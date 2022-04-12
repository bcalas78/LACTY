
if @review.persisted?
  json.form json.partial!("reviews/form.html.erb", product: @product, review: Review.new)
  json.inserted_item json.partial!("products/review.html.erb", review: @review)
else
  json.form json.partial!("reviews/form.html.erb", product: @product, review: @review)
end
