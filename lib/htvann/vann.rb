class Htvann::Vann
    attr_accessor :name, :price, :avaiability, :url

    def self.today
       self.scrape_deals
    end 
   
    def self.scrape_deals
    vann = []
     vann << self.scrape_woot
     vann << self.scrape_rental

     vann
    end

    def self.scrape_woot
        doc = Nokogiri::HTML(open("https://www.rosegal.com/plus-size-tank-tops/plus-size-asymmetric-sunflower-print-tank-top-7346094.html"))

        vann = self.new
        vann.name = doc.search(".goods-title-wrap").css('h1.goods_title').text
        vann.price = doc.search(".my_shop_price").first.text
        vann.avaiability = "In stock" 
        #binding.pry
        vann
    end 

    def self.scrape_rental
        doc = Nokogiri::HTML(open("https://www.vrbo.com/search/keywords:rio-de-janeiro-state-of-rio-de-janeiro-brazil/filter:92"))

        vann = self.new
        vann.name = doc.search("h4.HitInfo__headline").first.text
        vann.price = doc.search(".Price__value").first.text
        vann.avaiability = "In stock" 
        #binding.pry
        vann
    end 
end 