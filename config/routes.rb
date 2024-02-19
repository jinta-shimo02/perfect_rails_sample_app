Rails.application.routes.draw do
  root 'welcome#index'
  # OmniAuthによる認証が成功した場合、デフォルトで下記のURLがコールバックとして利用される。
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
