ActiveAdmin.register Category do
    index do
        column :english_title
        column :arabic_title
        column :slug
        default_actions
    end

    show :title => :english_title do
        panel("Details") do
            attributes_table_for resource, :slug, :english_title, :arabic_title
        end
    end

    form do |f|
        f.inputs do
          f.input :slug
          f.input :english_title
          f.input :arabic_title
        end
        f.buttons
    end
end
