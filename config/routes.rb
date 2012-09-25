ScrumMeetings::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: "welcome#login"
  get "welcome/index"

  scope "api" do
    resources :projects, :defaults => { :format => 'json' }
  end

end
