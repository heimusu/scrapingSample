require 'nokogiri'
require 'anemone'

opts = {
    depth_limit:0
}

Anemone.crawl('http://www.nicovideo.jp/ranking',opts) do |anemone|
    anemone.on_every_page do |page|
        i = 1

        page.doc.xpath("/html/body//section[@class='content']/div[contains(@class,'contentBody')]//li[contains(@class,'videoRanking')]/div[@class='itemContent']").each do |node|

            title = node.xpath("./p/a/text()").to_s

            viewCount = node.xpath("./div[@class='itemData']//li[contains(@class,'view')]/span/text()").to_s

            puts i.to_s + "位：再生数：" + viewCount + "|" + title
            puts "-----------------------------"
            i += 1
        end
    end
end
