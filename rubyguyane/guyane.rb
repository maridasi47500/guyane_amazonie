require "open-uri"
require "mysql2"
require "nokogiri"

require "active_support"
require 'active_support/core_ext/string/filters'
require "active_support/core_ext/string/inflections"


  

c = Mysql2::Client.new(:host => "localhost", :username => "Sophia",:database=>"guyane_amazonie",:password=>"Root123!")


@doc=Nokogiri::HTML(URI.open('https://www.guyane-amazonie.fr/carte-interactive'))
@list=@doc.css("form span.label-syndication.accordion-heading, form .form-carto-criteres .form-type-checkboxes label, form .form-carto-criteres .form-type-checkboxes .form-checkboxes .form-type-checkbox")
p @list.length
            @m = Mysql2::Client.new(:host => "localhost", :username => "Sophia",:database=>"guyane_amazonie",:password=>"Root123!")
@list.each do |element|
  case element.name
  when "span"
    p 1
    text=element.text.strip.squish
    @page=text.parameterize.underscore

escaped=@m.escape(text)
    sql="INSERT INTO mypages (title) VALUES ('#{escaped}')"
    p sql
    @m.query(sql)
    query="select * from mypages where title = '#{escaped}' limit 1"
    p query
    @n=@m.query(query)
    p @page
  when "label"
    p 2
    text=element.text
    @typeoption=text
        
    raise "error !!" if element.attributes["class"]    
    escaped=@m.escape(text)
    @id=@n.to_a[0]['id']
    sql="INSERT INTO optiontypes (mypage_id,title) VALUES ('#{@id}','#{escaped}')"
    p sql
    @m.query(sql)
    query="select * from optiontypes where mypage_id = '#{@id}' and title = '#{escaped}' limit 1"
    p query
    @l=@m.query(query)
  when "div"
    p 3
    text=element.css('label').text
    escaped= @m.escape(text)
    
    res= @l.to_a[0]['id']
    p res
    
    sql="INSERT INTO options (optiontype_id,title) VALUES (#{res},'#{escaped}')"
    p sql
    @option=@m.query(sql)
    p @option
 
  end
rescue => e
  p e.inspect
end

