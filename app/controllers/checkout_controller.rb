class CheckoutController < ApplicationController

    def create 
        @product = Product.find(params[:hotel_id])
        puts "================================"
        puts @product 
        
        @session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            price_data: {
              currency: 'inr',
              product_data: {
                name: @product.name,
                description: @product.description,
                images: ['https://media.istockphoto.com/id/1328049157/photo/mens-short-sleeve-t-shirt-mockup-in-front-and-back-views.jpg?b=1&s=170667a&w=0&k=20&c=CZ5Emlrh-C4jzojJ8b8YBy1frxpQr6aMcLmEBrkty7Q=']
              },
              unit_amount: @product.price*100 # amount in paisa
            },
            quantity: 1
          }],
          mode: 'payment',
          success_url: 'http://localhost:3000/payments/success',
          cancel_url: 'http://localhost:3000/payments/cancel'
        )
    end
    
end
