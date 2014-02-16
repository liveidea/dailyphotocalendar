namespace "dphoto" do 
	task:show_all=>:envirovment do
		Photo.all.each {|p| p p.title}	
	end
end