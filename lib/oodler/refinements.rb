module Oodler


class Refinements
  include ROXML
  xml_accessor :values, :as =>[Refinement], :in =>"attributes"
end

end