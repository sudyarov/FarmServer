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
		@vegetables = Vegetable.find(
			:all, 
			:joins => "as veg left join vegetable_types as veg_types on veg.type_id=veg_types.id",
			:select => "veg.id as id, veg_types.vtype, veg.row, veg.column, veg.stage",
			:order => "veg.column, veg.row DESC"
		)
		render :layout => "list"
	end
	
	def addVegetable(newVegetable)
		@vegetable = Vegetable.new(
			:type_id => newVegetable.attributes['type'], 
			:row => newVegetable.attributes['row'], 
			:column => newVegetable.attributes['column'], 
			:stage => 1 
		)
		@vegetable.save
		render :layout => "added"
	end
	
	def delVegetable(vegetable)
		begin
			Vegetable.delete(vegetable.attributes['id'])
		rescue
			render :layout => "error"
			return
		end
		render :layout => "deleted"
	end
end
