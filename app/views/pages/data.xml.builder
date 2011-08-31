xml.instruct! :xml, :version=>"1.0" 

xml.tag!("rows") do
	@mp3s.each do |mp3|
		xml.tag!("row",{ "id" => mp3.id }) do
			xml.tag!("cell", mp3.title)
			xml.tag!("cell", mp3.artist)
			xml.tag!("cell", mp3.url)
		end
	end
end