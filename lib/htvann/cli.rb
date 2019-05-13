class Htvann::CLI
    def call 
        list_deals 
        menu
        goodbye
    end 

    def list_deals
        puts "Today's Htvann deal"
        @vann = Htvann::Vann.today
        @vann.each.with_index(1) do |vann, x|
            puts "#{x}. #{vann.name} - #{vann.price} - #{vann.avaiability}"
        end 
    end 

    #Menu method
    def menu
        input = nil
    while input != "exit"
        puts "Enter the number of the deal you'd like more info on or type list to see all product or type exit to exit"
        input = gets.strip.downcase
        if input.to_i > 0
            the_deal = @vann[input.to_i-1]
            puts "#{the_deal.name} - #{the_deal.price} - #{the_deal.avaiability}"
        elsif input == "list"
            list_deals
        else
            puts "Not sure what you want, type list or exit"
        end 
    end 
    end

    #Goodbye method
    def goodbye
        puts "see you tomorrow for more details!!!"
    end
end 