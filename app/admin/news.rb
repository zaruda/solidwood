ActiveAdmin.register News do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :description, :body, :news_type, :published_at, :banner

  scope :published
  scope :unpublished

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :news_type
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :news_type
      f.input :body, as: :ckeditor
      f.input :banner, :as => :file
        # f.input :banner, :as => :file, :hint => f.image_tag(f.object.head_image.url(:medium))
    end
    actions
  end

  action_item :publish, only: :show do
    link_to "Publish", publish_admin_news_path(news), method: :put if !news.published_at?
  end

  action_item :unpublish, only: :show do
    link_to "Unpublish", unpublish_admin_news_path(news), method: :put if news.published_at?
  end

  member_action :publish, method: :put do
    post = News.friendly.find(params[:id])
    post.update(published_at: Time.zone.now)
    redirect_to admin_news_path(post)
  end

  member_action :unpublish, method: :put do
    post = News.friendly.find(params[:id])
    post.update(published_at: nil)
    redirect_to admin_news_path(post)
  end


end
