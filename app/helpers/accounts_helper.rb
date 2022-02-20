module AccountsHelper

    def profile_picture account, width = 100 
        image_url = account&.image.present? ? account.image.thumb.url : "placeholder-profile.jpeg"
        image_tag(image_url, width: width, class: "img-circle")
    end
    def can_edit_profile? profile_id
        account_signed_in? && current_account.id == profile_id
    end
end
