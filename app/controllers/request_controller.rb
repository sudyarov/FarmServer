class RequestController < ApplicationController
	def form
	end

	def main
		xml_data = params[:command]
		xml = REXML::Document.new(xml_data)
		commandName = xml.elements['command'].attributes['name']
		
		case commandName
			when "getField": getField
			when "addVegetable": addVegetable(xml.elements['command'].elements['vegetable'])
			when "delVegetable": delVegetable(xml.elements['command'].elements['vegetable'])
		end
	end
	
	def getField
		@vegetables = Vegetable.find(:all)
		render :layout => "list"
	end
	
	def addVegetable(newVegetable)
		@vegetable = Vegetable.new(
			:type_id => newVegetable.attributes['type'], 
			:x => newVegetable.attributes['x'], 
			:y => newVegetable.attributes['y'], 
			:stage => 1 
		)
		@vegetable.save
		render :layout => "added"
	end
	
	def delVegetable(vegetable)
		Vegetable.delete(vegetable.attributes['id'])
		render :layout => "deleted"
	end
end
