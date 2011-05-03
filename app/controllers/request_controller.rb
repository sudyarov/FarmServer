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
			when "nextStep": nextStep
			when "getImage": getImage(xml)
#unknown command
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
		@vtype = newVegetable.attributes['type']
		vegType = VegetableType.find(
			:first,
			:select => "id",
			:conditions => "vtype='#{@vtype}'"
		)
		@vegetable = Vegetable.new(
			:type_id => vegType.id, 
			:row => newVegetable.attributes['row'], 
			:column => newVegetable.attributes['column'], 
			:stage => 1 
		)
		@vegetable.save!
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
	
	def nextStep
		vegetables = Vegetable.find(:all)
		
		begin
			Vegetable.transaction do
				for vegetable in vegetables
					if vegetable.stage < 5
						vegetable.stage += 1
						vegetable.save!
					end
				end
			end
		rescue
			render :layout => "error"
			return
		end
		
		render :layout => "nextStep"
	end
	
	def getImage(xml)
		vtype = xml.elements['command'].attributes['type']
		stage = xml.elements['command'].attributes['stage']
		
		image = VegetableImage.find(
			:first, 
			:joins => "as veg_image left join vegetable_types as veg_types on veg_image.type_id=veg_types.id",
			:select => "veg_image.url",
			:conditions => "veg_types.vtype = '#{vtype}' AND veg_image.stage = #{stage}"
		)
		
		send_file(image.url, :type => "image/png")
	end
end
