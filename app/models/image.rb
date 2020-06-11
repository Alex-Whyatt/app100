class Image < ApplicationRecord
  belongs_to :album
  has_one_attached :drawing
  has_rich_text :body

	def drawing_f
  		return self.drawing.variant(resize: "200x200!").processed
 	end

 	def drawing_big
  		return self.drawing.variant(resize: "400x400!").processed
 	end

 	def add_one
 		self.id + 1
 	end

 	def take_one
 		self.id - 1
 	end

 	def next_1
 		self.add_one unless !album.images.where("id > ?", self.id).exists?
  	end

  	def prev_1
 		self.take_one unless !album.images.where("id < ?", self.id).exists?
  	end
end


##Image.offset(self.id).limit(1).order("id ASC").first