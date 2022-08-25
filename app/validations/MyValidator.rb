class MyValidator < ActiveModel::Validator
	def validate(record)
		unless record.title.start_with? 'X'
			record.errors[:name] << "Title must start with X"

			
		end
	end
end
