class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  default_scope { order(created_at: :desc) }

  # Текущему пользователю не нужно отправлять апдейт этим способом,
  # он получит апдейт с помощью стандартного турбострима.
  # 
  # Другому пользователю нужно отправить апдейт броадкастом,
  # но не нужно пытаться проверять его авторство, так как
  # он в любом случае не автор только что созданного поста.
  # 
  after_create_commit { broadcast_prepend_to("comments", locals: { from_stream: true }) }
  after_create_commit { broadcast_replace_to("comments_counter", target: "comments_counter", partial: "comments/counter", locals: { commentable: commentable }) }

end
