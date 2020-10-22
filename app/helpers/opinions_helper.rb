module OpinionsHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def destroy_opinion(opinion, current_user)
    return unless opinion.user_id == current_user.id

    content_tag(:p, class: 'float-right') do
      link_to 'Destroy', opinion, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
