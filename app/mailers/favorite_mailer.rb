class FavoriteMailer < ApplicationMailer
  default from: "oriphant@gmail.com"

  def new_comment(user, post, comment)
    #New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@ralbloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@ralbloccit.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
end
