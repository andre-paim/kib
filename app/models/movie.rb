class Movie < ActiveRecord::Base
  
  belongs_to :director
  
  has_many :roles
  has_many :actors, :through => :roles
  
end
# id  title  director_id    year
# -- --------- -----------  ----
# 34 Apollo 13    72        1995