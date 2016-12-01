module ListingsHelper

 def boolean_to_icon(bool)
   p bool
    if bool
      "✔"
    else
      "✘"
    end
  end

end
