require 'nokogiri'
require 'anemone'

opts = {
    depth_limit:0
}

Anemone.crawl('http://www.city.sabae.fukui.jp/users/kanko/event/',opts) do |anemone|
    anemone.on_every_page do |page|
        i = 1

        #page.doc.xpath("/html/body//div[contains(@class,'topics-eventList')]//p[contains(@class,'topics-eventTitle')]").each do |node|
        page.doc.xpath("/html/body//div[contains(@class,'topics-eventList')]").each do |node|
            #title = node.xpath("./p/a/text()").to_s
            title = node.xpath("./p[contains(@class,'topics-eventTitle')]/text()").to_s
            date = node.xpath("./p[contains(@class,'topics-eventDay')]/text()").to_s
            puts title + date

            #viewCount = node.xpath("./div[@class='itemData']//li[contains(@class,'view')]/span/text()").to_s

=begin
            puts i.to_s + "位：再生数：" + viewCount + "|" + title
            puts "-----------------------------"
=end
            i += 1
        end
    end
end
