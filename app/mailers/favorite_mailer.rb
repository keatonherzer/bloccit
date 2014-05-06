class FavoriteMailer < ActionMailer::Base
  default from: "keatonh12@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # new headers
    headers["Message-ID"] = "<comments/#{@comment.id}@ybloccit.example>"
    headers["In-Reply-To"] = "<post/#{@post.id}@bloccit.example>"
    headers["References"] = "<post/#{@post.id}@bloccit.example>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

end
