# app/mailers/favorite_mailer.rb

class FavoriteMailer < ActionMailer::Base
  default from: "mrtest@mailinator.com"

    def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@bloccit.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@bloccit.com>"
    headers["References"] = "<post/#{@post.id}@bloccit.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end

