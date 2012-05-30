ActiveAdmin.register Slide do

  controller do
    actions :all, :except => [:new, :destroy, :show]
  end

  index do
    column :name do |slide|
      link_to slide.english_text1, edit_admin_slide_path(slide)
    end
  end

  show :title => :english_text1 do
    panel("English Details") do
      attributes_table_for resource, :english_text1, :english_text2, :english_text3, :english_text4, :english_text5
    end
    panel("Arabic Details") do
      attributes_table_for resource, :arabic_text1, :arabic_text2, :arabic_text3, :arabic_text4, :arabic_text5
    end
  end

  form do |f|
    f.inputs do
      f.input :english_text1, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input  :arabic_text1, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input :english_text2, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input  :arabic_text2, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input :english_text3, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input  :arabic_text3, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input :english_text4, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input  :arabic_text4, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input :english_text5, :as         => :text,
                              :input_html => { :rows => 3 }
      f.input  :arabic_text5, :as         => :text,
                              :input_html => { :rows => 3 }
    end

    f.buttons
  end
end
