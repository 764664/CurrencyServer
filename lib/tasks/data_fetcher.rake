namespace :seed do
  desc "Fetch UnionPay data"
  task :unionpay => :environment do
    Date.new(2014,1,1).upto(Date.today) do |date|
      begin
          from, to = 'JPY', 'CNY'
          uri = URI('http://www.unionpayintl.com/upiweb-card/serviceCenter/rate/search')
          res = Net::HTTP.post_form(uri, 'baseCurrency' => to, 'transactionCurrency' => from, 'curDate' => date.to_s)
          json = JSON.parse(res.body)
          Currency.create(
            rate: json['exchangeRate'],
            date: date,
            from: from,
            to: to,
            source: 'unionpay'
          )
          print '.'
      rescue Exception => e
          puts e
      end
      sleep 3
    end
  end
end