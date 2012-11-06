ActiveAdmin.register Page do
  controller do
    defaults :finder => :find_by_permalink
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :permalink
      f.input :content
      f.input :placement, as: :select, collection: Page::PLACEMENTS
    end
    f.actions
  end


end
