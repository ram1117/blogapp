require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  path '/api/users/{user_id}/posts' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'

    get('list posts') do
      response(200, 'successful') do
        let(:user_id) { 2 }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  # path '/api/users/{user_id}/posts/new' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

  #   get('new post') do
  #     response(200, 'successful') do
  #       let(:user_id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true),
  #           },
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  path '/api/users/{user_id}/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show post') do
      response(200, 'successful') do
        let(:user_id) { 2 }
        let(:id) { 6 }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
