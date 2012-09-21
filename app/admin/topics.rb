ActiveAdmin.register Topic do
  controller do
    defaults :finder => :find_by_slug
  end  
end
